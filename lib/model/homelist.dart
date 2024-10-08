import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web/model/access_rule.dart';
import 'package:web/screens/aboutRam_screen.dart';
import 'package:web/screens/grade/master_grade_app_home_screen.dart';
import 'package:web/screens/runewsScreen.dart';
import 'package:web/screens/schedule/schedule_home_screen.dart';
import 'package:web/screens/success/master_success_profile_screen.dart';
import 'package:web/screens/success/success_profile.dart';

var stdcode;

class HomeList {
  HomeList(
      {this.navigateScreen,
      this.imagePath = '',
      this.iconsData,
      this.color,
      this.roles});

  Widget? navigateScreen;
  String imagePath;
  IconData? iconsData;
  MaterialColor? color;
  List<UserRole>? roles;

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    //check token มีจริงม้ย หรือหมดอายุหรือไม่
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  static List<HomeList> homeList = [
    HomeList(
        imagePath: 'assets/fitness_app/A18.png',
        iconsData: Icons.abc,
        color: Colors.purple,
        navigateScreen: aboutRam(),
        roles: [
          UserRole.Guest,
          UserRole.Bachelor,
          UserRole.Master,
          UserRole.Doctor
        ]),
    HomeList(
      imagePath: 'assets/fitness_app/A14.png',
      iconsData: Icons.newspaper,
      color: Colors.brown,
      navigateScreen: RunewsScreen(),
      roles: [
        UserRole.Guest,
        UserRole.Bachelor,
        UserRole.Master,
        UserRole.Doctor
      ],
    ),
    HomeList(
      imagePath: 'assets/fitness_app/A20.png',
      iconsData: Icons.calendar_month,
      color: Colors.brown,
      navigateScreen: ScheduleHomeScreen(),
      roles: [
        UserRole.Guest,
        UserRole.Bachelor,
        UserRole.Master,
        UserRole.Doctor
      ],
    ),
    HomeList(
        imagePath: 'assets/egraduate/4.png',
        iconsData: Icons.account_box,
        color: Colors.pink,
        navigateScreen: MasterGradeAppHomeScreen(),
        roles: [
          UserRole.Guest,
          UserRole.Bachelor,
          UserRole.Master,
          UserRole.Doctor
        ]),
    HomeList(
        imagePath: 'assets/egraduate/5.png',
        iconsData: Icons.abc,
        color: Colors.yellow,
        navigateScreen: MasterSuccessProfileScreen(),
        roles: [
          UserRole.Guest,
          UserRole.Bachelor,
          UserRole.Master,
          UserRole.Doctor
        ]),
    // HomeList(
    //   imagePath: 'assets/fitness_app/A2.png',
    //   iconsData: Icons.app_registration,
    //   color: Colors.brown,
    //   navigateScreen: MasterRegisterHomeScreen(),
    //   roles: [UserRole.Master, UserRole.Doctor],
    // ),
    // HomeList(
    //   imagePath: 'assets/fitness_app/A2.png',
    //   iconsData: Icons.app_registration,
    //   color: Colors.brown,
    //   navigateScreen: SplashScreen(),
    //   roles: [UserRole.Guest],
    // ),
  ];
}
