import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gatech/models/news.dart';
import 'package:gatech/models/news_repository.dart';
import 'package:gatech/services/apis/api_response.dart';

class GameViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchGamesData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching post data');
    try {
      List<News> gameList = await NewsRepository().fetchNewsList(value);
      _apiResponse = ApiResponse.completed(gameList);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }
}
