import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:web/app_theme.dart';
import 'package:web/model/access_rule.dart';
import 'package:web/navigation_home_screen.dart';
import 'package:web/screens/aboutRam_screen.dart';
import 'package:web/providers/authenprovider.dart';
import 'package:web/providers/home_provider.dart';
import 'package:web/screens/runewsScreen.dart';
import 'package:web/screens/schedule/schedule_home_screen.dart';
import 'package:web/widget/ru_wallpaper.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';
import 'model/homelist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<HomeList> homeList = [];
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    super.initState();
  }

  Future<bool> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  int _selectedMenu = 0; // Tracks selected bottom bar item

  void _onItemTapped(int index) {
    Provider.of<HomeProvider>(context, listen: false).getTimeHomePage();
    setState(() {
      _selectedMenu = index;
    });
    if (index == 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
    } else if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => aboutRam()));
    } else if (index == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ScheduleHomeScreen()));
    } else if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RunewsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var authen = context.watch<AuthenProvider>();
    final accessControl = AccessControl(AccessControl.Role(authen.role));
    homeList = accessControl.getButtonItems();

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        iconTheme: IconThemeData(
          color: isLightMode
              ? AppTheme.nearlyWhite
              : AppTheme.nearlyBlack, // Change back arrow color to white
        ),
        title: Text(
          'ระบบสารสนเทศปริญญาโทและเอก (Egraduate)',
          style: AppTheme.title,
        ),
        centerTitle: true, // Centers the title
        backgroundColor:
            AppTheme.ru_dark_blue, // Background color of the AppBar
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.help,
              color: isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
            ),
            onPressed: () {
              Get.toNamed("/homehelp");
            },
          ),
          Container(
            width: AppBar().preferredSize.height - 8,
            height: AppBar().preferredSize.height - 8,
            color: AppTheme.ru_dark_blue,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius:
                    BorderRadius.circular(AppBar().preferredSize.height),
                child: Icon(
                  multiple ? Icons.dashboard : Icons.view_agenda,
                  color:
                      isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
                ),
                onTap: () {
                  setState(() {
                    multiple = !multiple;
                  });
                },
              ),
            ),
          )
        ],
      ),
      backgroundColor:
          isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            final Animation<double> animationForImage =
                Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animationController!,
                curve: Interval((1 / 7) * 2, 1.0, curve: Curves.fastOutSlowIn),
              ),
            );
            late final AnimationController _controller = AnimationController(
              duration: const Duration(seconds: 3),
              vsync: this,
            )..repeat(reverse: true);
            late final Animation<double> _animation = CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOutCubic,
            );
            return MouseRegion(
              onHover: (event) {
                Provider.of<AuthenProvider>(context, listen: false)
                    .getProfile();
                homeList = accessControl.getButtonItems();
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, -2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            RuWallpaper(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Text('$')
                                // Container(
                                //   height: MediaQuery.of(context).size.width *
                                //       30 /
                                //       100,
                                //   width: MediaQuery.of(context).size.width,
                                //   child: FadeTransition(
                                //       opacity: animationForImage,
                                //       child: homeImageSlider()),
                                // ),

                                Expanded(
                                  child: FutureBuilder<bool>(
                                    future: getData(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<bool> snapshot) {
                                      if (!snapshot.hasData) {
                                        return const SizedBox();
                                      } else {
                                        return GridView(
                                          padding: const EdgeInsets.only(
                                              top: 0, left: 12, right: 12),
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          children: List<Widget>.generate(
                                            accessControl
                                                .getButtonItems()
                                                .length,
                                            (int index) {
                                              final int count = accessControl
                                                  .getButtonItems()
                                                  .length;
                                              final Animation<double>
                                                  animation = Tween<double>(
                                                          begin: 0.0, end: 1.0)
                                                      .animate(
                                                CurvedAnimation(
                                                  parent: animationController!,
                                                  curve: Interval(
                                                      (1 / count) * index, 1.0,
                                                      curve:
                                                          Curves.fastOutSlowIn),
                                                ),
                                              );
                                              animationController?.forward();
                                              return HomeListView(
                                                animation: animation,
                                                animationController:
                                                    animationController,
                                                listData: homeList[index],
                                                callBack: () {
                                                  Navigator.push<dynamic>(
                                                    context,
                                                    MaterialPageRoute<dynamic>(
                                                      builder: (BuildContext
                                                              context) =>
                                                          homeList[index]
                                                              .navigateScreen!,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: multiple ? 12 : 4,
                                            mainAxisSpacing: 6.0,
                                            crossAxisSpacing: 6.0,
                                            childAspectRatio: 1.0,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView(
      {Key? key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        var brightness = MediaQuery.of(context).platformBrightness;
        bool isLightMode = brightness == Brightness.light;
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        listData!.imagePath,
                        fit: BoxFit.contain,
                        //colorBlendMode: BlendMode.saturation,
                      ),
                    ),

                    // Positioned.fill(
                    //   child: Icon(listData!.iconsData,
                    //               size: 120,
                    //               color: listData!.color,
                    //               ),
                    // ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        onTap: callBack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
