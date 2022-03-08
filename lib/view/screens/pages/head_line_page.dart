import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_5_news_app/view/components/head_line_item.dart';
import 'package:training_5_news_app/view/components/page_transformer.dart';
import 'package:training_5_news_app/viewmodels/head_line_viewmodel.dart';

import '../../../data/search_type.dart';
import '../news_web_page_screen.dart';

class HeadLinePage extends StatelessWidget {
  const HeadLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HeadLineViewModel>();

    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getHeadLines(searchType: SearchType.HEAD_LINE));
    }
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<HeadLineViewModel>(
            builder: (context, model, child) {
              if (model.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return PageTransformer(
                  pageViewBuilder: (context, pageVisibilityResolver) {
                    return PageView.builder(
                        controller: PageController(viewportFraction: 0.9),
                        itemCount: model.articles.length,
                        itemBuilder: (context, index) {
                          final article = model.articles[index];
                          final pageVisibility = pageVisibilityResolver
                              .resolvePageVisibility(index);
                          final visibleFraction =
                              pageVisibility.visibleFraction;
                          return HeadLineItem(
                              article: model.articles[index],
                              pageVisibility: pageVisibility,
                              onArticleClicked: (article) =>
                                  _openArticleWebPage(context, article));
                        });
                  },
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => onRefresh(context),
        ),
      ),
    );
  }

  //TODO 更新処理
  onRefresh(BuildContext context) async {
    print("HeadLinePage.onRefresh");
    final viewModel = context.read<HeadLineViewModel>();
    await viewModel.getHeadLines(searchType: SearchType.HEAD_LINE);
  }
///Pageクリック後、画面遷移処理
  _openArticleWebPage(BuildContext context, article) {
    print("HeadLinePage._openArticleWebPage:${article.url}");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewsWebPageScreen(
          article: article,
        ),
      ),
    );
  }
}
