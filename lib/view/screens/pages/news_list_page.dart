import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_5_news_app/data/category_info.dart';
import 'package:training_5_news_app/data/search_type.dart';
import 'package:training_5_news_app/viewmodels/news_list_viewmodel.dart';

import '../../components/category_chips.dart';
import '../../components/search_bar.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NewsListViewModel>();

    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
     Future (() => viewModel.getNews(
          searchType: SearchType.CATEGORY,
          keyword: "",
          category: categories[0]
      ));
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: "更新",
          onPressed: () => onRefresh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //TODO　検索ワード
              SearchBar(
                onSearch: (keyword) => getKeywordNews(context, keyword),
              ),
              //TODO　カテゴリー選択Chips
              CategoryChips(onCategorySelected: (category) => getCategoryNews(context,category),),
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//TODO 記事更新処理
  onRefresh(BuildContext context) async {
    final viewModel = context.read<NewsListViewModel>();
    viewModel.getNews(
        searchType: viewModel.searchType,
        keyword: viewModel.keyword,
        category: viewModel.category,
    );
    print("NewsListPage.onRefresh");
  }
//TODO キーワード取得処理
  getKeywordNews(BuildContext context, keyword) {
    final viewModel = context.read<NewsListViewModel>();
    viewModel.getNews(
        searchType: SearchType.KEYWORD,
        keyword: keyword,
        category: categories[0],
    );
    print("NewsListPage.getKeywordNews");
  }
//TODO カテゴリー記事取得処理
  getCategoryNews(BuildContext context, Category category) {
    final viewModel = context.read<NewsListViewModel>();
    viewModel.getNews(
        searchType: SearchType.CATEGORY,
        category: category,
        keyword: '',
    );
    print("NewsListPage.getCategoryNews / category:${category.nameJp}");
  }
}
