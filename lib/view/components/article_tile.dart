import 'package:flutter/material.dart';
import 'package:training_5_news_app/models/model/news_model.dart';
import 'package:training_5_news_app/view/components/article_tile_desc.dart';
import 'package:training_5_news_app/view/components/image_from_url.dart';

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
                flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageFromUrl(imageUrl: article.urlToImage),
                  ),
              ),
              Expanded(
                  flex:3,
                  //TODO
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ArticleTileDesc(
                      article: article,
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
