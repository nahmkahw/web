import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:web/exceptions/dioexception.dart';
import 'package:web/model/profile.dart';
import 'package:web/model/rutoken.dart';

class AuthenService {
  final appUrl = dotenv.env['APP_URL'];
  Future<Profile> getAuthenGoogle() async {
    final googleSingIn = GoogleSignIn(
      clientId:
          '630106548850-ki8em661t4ak8agmcg4jiephsh5ubuec.apps.googleusercontent.com',
    );
    Profile profile;
    try {
      //print('signIn');
      GoogleSignInAccount? user = await googleSingIn.signIn();
      //print(user);
      GoogleSignInAuthentication usergoogle = await user!.authentication;
      //print(usergoogle.accessToken);
      // ignore: avoid_print
      //print('user: ${usergoogle.idToken}');

      String studentcode = user.email.substring(0, 10);

      var params = {"std_code": studentcode};
      var response = await Dio().post(
        '$appUrl/google/authorization',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "authorization": "Bearer ${usergoogle.idToken}",
          },
        ),
        data: jsonEncode(params),
      );

      if (response.statusCode == 200) {
        Rutoken token = Rutoken.fromJson(response.data);
        // ignore: avoid_print
        //print('response ${response.data}');
        // print('rutoken : ${token.accessToken}');
        profile = Profile.fromJson({
          'displayName': user.displayName,
          'email': user.email,
          'studentCode': studentcode,
          'photoUrl': user.photoUrl,
          'googleToken': usergoogle.idToken,
          'accessToken': token.accessToken,
          'refreshToken': token.refreshToken,
          'isAuth': token.isAuth
        });

        //print(profile.email);
        return profile;
      } else {
        throw ('Error Authentication Ramkhamhaeng University.');
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      //print('${err.response} ...');
      throw ('Error Authentication Ramkhamhaeng University: $errorMessage .');
    } catch (e) {
      // print('เกิดข้อผิดพลาดในการเชื่อมต่อ. $e');
      throw ('เกิดข้อผิดพลาดในการเชื่อมต่อ. $e');
    }
  }

  Future<Profile> getAuthenGoogleDev(String std_code) async {
    Profile profile;
    try {
      var params = {"std_code": std_code};
      var response = await Dio().post(
        '$appUrl/google/authorization-test',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            "authorization": "Bearer ",
          },
        ),
        data: jsonEncode(params),
      );

      if (response.statusCode == 200) {
        Rutoken token = Rutoken.fromJson(response.data);
        // print("-------------ru authen success-------------------\n");
        // print('response ${response.data}');
        // print('rutoken : ${token.accessToken}');
        profile = Profile.fromJson({
          'displayName': "$std_code",
          'email': "$std_code@rumail.ru.ac.th",
          'studentCode': std_code,
          'photoUrl': '',
          'googleToken': '',
          'accessToken': token.accessToken,
          'refreshToken': token.refreshToken,
          'isAuth': token.isAuth
        });
        // print(profile.email);
        return profile;
      } else {
        throw ('Error Authentication Ramkhamhaeng University.');
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      //print('Error Authentication Ramkhamhaeng University: $errorMessage .');
      throw ('Error Authentication Ramkhamhaeng University: $errorMessage .');
    } catch (e) {
      // print('เกิดข้อผิดพลาดในการเชื่อมต่อ. $e');
      throw ('เกิดข้อผิดพลาดในการเชื่อมต่อ. $e');
    }
  }
}
