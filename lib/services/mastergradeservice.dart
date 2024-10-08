import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web/model/master_grade.dart';

import 'package:web/services/diointercepter.dart';
import '../../model/profile.dart';

class MasterGradeService {
  final appUrl = dotenv.env['APP_URL'];
  final dioapi = DioIntercepter();

  Future<MasterGrade> getAllGrade(Profile profile) async {
    await dioapi.createIntercepter();
    MasterGrade gradedata = MasterGrade.fromJson({});
    try {
      var response = await dioapi.api.get(
        '$appUrl/master/grade/',
      );
      if (response.statusCode == 200) {
        gradedata = MasterGrade.fromJson(response.data);
      } else {
        throw ('Error Get Data');
      }
    } catch (err) {
      rethrow;
    }

    return gradedata;
  }
}
