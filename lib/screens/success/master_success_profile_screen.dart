import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/app_theme.dart';
import 'package:web/model/tabicon_data.dart';
import 'package:web/providers/authenprovider.dart';
import 'package:web/providers/master_provider.dart';
import 'package:web/screens/success/master_success_profile_view.dart';

String? tokenGrade;

class MasterSuccessProfileScreen extends StatefulWidget {
  @override
  _MasterSuccessProfileScreenState createState() =>
      _MasterSuccessProfileScreenState();
}

class _MasterSuccessProfileScreenState extends State<MasterSuccessProfileScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody =
        MasterSuccessProfileView(animationController: animationController);
    Provider.of<AuthenProvider>(context, listen: false).getProfile();
    Provider.of<MasterProvider>(context, listen: false).getSuccess();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 600));
    return true;
  }
}
