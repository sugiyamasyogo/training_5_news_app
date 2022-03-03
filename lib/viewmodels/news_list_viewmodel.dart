import 'package:flutter/material.dart';
import 'package:training_5_news_app/data/category_info.dart';
import 'package:training_5_news_app/data/search_type.dart';
import 'package:training_5_news_app/models/model/news_model.dart';
import 'package:training_5_news_app/repository/news_repository.dart';

class NewsListViewModel extends ChangeNotifier {
  final NewsRepository _repository = NewsRepository();

  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType;

  Category _category = categories[0];
  Category get category => _category;

  String _keyword = "";
  String get keyword => _keyword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _article = [];
  List<Article> get article => _article;


  Future<void>getNews(
      {required SearchType searchType,
      required String keyword,
      required Category category}) async {
    _searchType = searchType;
    _keyword = keyword ;
    _category = category ;

    _isLoading = true;
    notifyListeners();

    print(
        "[ViewModel] searchType: $searchType / keyword: $keyword / category: ${category.nameJp}");


    //TODO
    _article = await _repository.getNews(
      searchType: _searchType,
      keyword: _keyword,
      category: _category,
    );

    _isLoading = false;
    notifyListeners();


  }
}
