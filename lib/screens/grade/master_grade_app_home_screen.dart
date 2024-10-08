import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/app_theme.dart';
import 'package:web/model/tabicon_data.dart';
import 'package:web/providers/authenprovider.dart';
import 'package:web/screens/grade/master_grade_screen.dart';

String? tokenGrade;

class MasterGradeAppHomeScreen extends StatefulWidget {
  @override
  _MasterGradeAppHomeScreenState createState() =>
      _MasterGradeAppHomeScreenState();
}

class _MasterGradeAppHomeScreenState extends State<MasterGradeAppHomeScreen>
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

    tabBody = MasterGradeScreen(animationController: animationController);
    super.initState();
    //Provider.of<AuthenProvider>(context, listen: false).getProfile();
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
