import 'package:flutter/material.dart';
import 'package:training_5_news_app/models/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebPageScreen extends StatelessWidget {
  final Article article;

  const NewsWebPageScreen({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(article.title ?? ""),
            centerTitle: true,
            //TODO
          ),
          body: WebView(
            initialUrl: article.url,
            javascriptMode: JavascriptMode.unrestricted,
          ),
    ),
    );
  }
}
