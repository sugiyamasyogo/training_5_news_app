import 'package:flutter/material.dart';
import 'package:training_5_news_app/repository/news_repository.dart';

import '../data/search_type.dart';
import '../models/model/news_model.dart';

class HeadLineViewModel extends ChangeNotifier {
  final NewsRepository _repository = NewsRepository();

  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _article = [];
  List<Article> get articles => _article;

  Future<void> getHeadLines({required SearchType searchType}) async {
    _searchType = searchType;
    _isLoading = true;
    notifyListeners();

    _article = await _repository.getNews(searchType: SearchType.HEAD_LINE);
    print(
        "[ViewModel] searchType: $_searchType / article:${_article[0].title}");


    _isLoading = false;
    notifyListeners();
  }
}
