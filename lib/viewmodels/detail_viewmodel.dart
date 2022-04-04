import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gatech/models/detail_news.dart';
import 'package:gatech/models/news_repository.dart';
import 'package:gatech/services/apis/api_response.dart';

class DetailViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    log(_apiResponse.status.toString());
    return _apiResponse;
  }

  Future<void> fetchDetailData(String value) async {
    log(value);
    _apiResponse = ApiResponse.loading('Fetching post data');
    try {
      DetailNews gameDetail = await NewsRepository().fetchNewsDetail(value);
      _apiResponse = ApiResponse.completed(gameDetail);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }
}
