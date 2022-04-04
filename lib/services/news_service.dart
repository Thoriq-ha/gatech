import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gatech/const.dart';

class NewsService {
  Future getResponse(String url) async {
    dynamic responseJson;

    try {
      var _response = await Dio().get('$HOST$url');
      responseJson = _response.data;
    } catch (e) {
      log(e.toString());
    }
    return responseJson;
  }
}
