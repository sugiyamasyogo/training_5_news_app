import 'dart:convert';

import 'package:training_5_news_app/models/model/news_model.dart';
import '../data/category_info.dart';
import '../data/search_type.dart';
import 'package:http/http.dart' as http;

class NewsRepository {

  static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
  static const API_KEY = "06ee6e09a1f54979bdc134a1d3e0a868";


  Future<List<Article>> getNews(
      {required SearchType searchType, String? keyword, Category? category}) async {

    List<Article> results = [];

    http.Response? response;

    switch (searchType) {
      case SearchType.HEAD_LINE:
        final requestUrl = Uri.parse(BASE_URL + "&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
    }
    switch (searchType) {
      case SearchType.KEYWORD:
        final requestUrl = Uri.parse(BASE_URL + "&q=$keyword&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
    }
    switch (searchType) {
      case SearchType.CATEGORY:
        final requestUrl = Uri.parse(
            BASE_URL + "&category=${category?.nameEn}&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
    }
    if (response?.statusCode == 200) {
      final responseBody = response?.body;
      results = await News.fromJson(jsonDecode(responseBody!)).articles;
    } else {
      throw Exception("Failed to load news");
    }
    return results;
  }
}