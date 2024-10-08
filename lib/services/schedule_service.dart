import 'package:dio/dio.dart';
import 'package:web/model/schedule.dart';
import 'package:web/services/diointercepter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ScheduleService {
  final dioapi = DioIntercepter();
  final calendarurl = dotenv.env['CALENDAR_URL'];
  Future<List<Schedule>> getSchedules() async {
    //print('Call Service schedule');
    try {
      await dioapi.createIntercepter();

      Response response = await dioapi.api
          .get('$calendarurl/CalendarCenter/ScheduleCenterFlutter');
      List<dynamic> data = response.data;
      return data.map((json) => Schedule.fromJson(json)).toList();
    } catch (error) {
      rethrow;
    }
  }
}
