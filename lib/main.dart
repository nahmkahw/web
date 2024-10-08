import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web/app_theme.dart';
import 'package:web/login_page.dart';
import 'package:web/navigation_home_screen.dart';
import 'package:web/providers/authenprovider.dart';
import 'package:web/providers/master_grade_provider.dart';
import 'package:web/providers/master_provider.dart';
import 'package:web/providers/runewsprovider.dart';
import 'package:web/providers/schedule_provider.dart';
import 'package:web/screens/runewsdetail_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web/screens/success/master_pdf_view.dart';
import 'package:web/screens/success/master_success_profile_check_screen.dart';
import 'package:web/screens/success/master_success_profile_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  //check token มีจริงม้ย หรือหมดอายุหรือไม่
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then(
      (_) => {HttpOverrides.global = MyHttpOverrides(), runApp(const MyApp())});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // Try running your application with "flutter run". You'll see the
    //     // application has a blue toolbar. Then, without quitting the app, try
    //     // changing the primarySwatch below to Colors.green and then invoke
    //     // "hot reload" (press "r" in the console where you ran "flutter run",
    //     // or simply save your changes to "hot reload" in a Flutter IDE).
    //     // Notice that the counter didn't reset back to zero; the application
    //     // is not restarted.
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthenProvider>(
              create: (_) => AuthenProvider()),
          ChangeNotifierProvider<RunewsProvider>(
              create: (_) => RunewsProvider()),
          ChangeNotifierProvider<ScheduleProvider>(
              create: (_) => ScheduleProvider()),
          ChangeNotifierProvider<MasterProvider>(
              create: (_) => MasterProvider()),
          ChangeNotifierProvider<MasterGradeProvider>(
              create: (_) => MasterGradeProvider()),
        ],
        child: GetMaterialApp(
          title: 'Egraduate',
          theme: ThemeData(
              primarySwatch: AppTheme.myColor,
              canvasColor: AppTheme.dark_grey,
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(84, 88, 89, 1.0),
                      fontFamily: AppTheme.ruFontKanit))),
          // home: const MyHomePage(),
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => MasterPdfView()),
            GetPage(
                name: '/success/:id',
                page: () => MasterSuccessProfileCheckScreen()),
            GetPage(name: '/home', page: () => NavigationHomeScreen()),
            GetPage(name: '/login', page: () => LoginPage()),
            GetPage(name: '/runewsdetail', page: () => RunewsdetailPage()),
          ],
          debugShowCheckedModeBanner: false,
        ));
  }
}
