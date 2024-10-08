import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:web/app_theme.dart';
import 'package:web/custom_drawer/drawer_user_controller.dart';
import 'package:web/custom_drawer/home_drawer.dart';
import 'package:web/home_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = MyHomePage();
          });
          break;
          // case DrawerIndex.Help:
          //   setState(() {
          //     screenView = HelpScreen();
          //   });
          //   break;
          // case DrawerIndex.Manual:
          //   setState(() {
          //     screenView = ManualHomeScreen();
          //   });
          //   break;
          // case DrawerIndex.FeedBack:
          //   setState(() {
          //     screenView = FeedbackScreen();
          //   });
          //   break;
          // case DrawerIndex.Invite:
          //   setState(() {
          //     screenView = InviteFriend();
          //   });
          //   break;
          // case DrawerIndex.AboutRam:
          //   setState(() {
          //     screenView = aboutRam();
          //   });
          break;
        default:
          break;
      }
    }
  }
}
