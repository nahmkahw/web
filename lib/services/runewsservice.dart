import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web/exceptions/dioexception.dart';
import 'package:web/model/runews.dart';
import 'package:web/services/diointercepter.dart';

class RunewsService {
  Dio dio = Dio();
  final dioapi = DioIntercepter();
  final runewsurl = dotenv.env['RUNEWS_URL'];
  Future<List<runews>> getAll() async {
    List<runews> runewsdata = [];
    try {
      await dioapi.createIntercepter();
      var response = await dioapi.api.get(
        '$runewsurl/NewsRu/NewsJsonConnext',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        runewsdata = runews.decode(jsonEncode(response.data));
        // print('${jsonEncode(response.data)} Test Runews');
        // print(runewsdata[0].author.toString());
      } else {
        throw ('Error Get Data');
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw (errorMessage);
    }

    return runewsdata;
  }
}
