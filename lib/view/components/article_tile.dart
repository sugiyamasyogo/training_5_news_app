import 'package:flutter/material.dart';
import 'package:training_5_news_app/models/model/news_model.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  final ValueChanged onArticleClicked;

  const ArticleTile({
    Key? key,
    required this.article,
    required this.onArticleClicked
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => onArticleClicked(article),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(),
              ),
              Expanded(
                  flex:3,
                  //TODO
                  child: Column(
                    children: [
                      Text(article.title ?? ""),
                      Text(article.publishDate ?? ""),
                      Text(article.description ?? ""),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
