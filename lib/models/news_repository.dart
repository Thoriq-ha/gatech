import 'package:gatech/models/detail_news.dart';
import 'package:gatech/services/news_service.dart';
import 'news.dart';

class NewsRepository {
  Future<List<News>> fetchNewsList(String value) async {
    dynamic response = await NewsService().getResponse(value);
    final jsonData = response as List;
    List<News> newsList = jsonData.map((tagJson) {
      return News.fromJson(tagJson);
    }).toList();
    return newsList;
  }

  Future<DetailNews> fetchNewsDetail(String value) async {
    dynamic response = await NewsService().getResponse(value);
    final jsonData = response['results'] as Map<String, dynamic>;
    DetailNews newsDetail = DetailNews.fromJson(jsonData);
    return newsDetail;
  }
}
