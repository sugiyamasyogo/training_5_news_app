import 'package:flutter/material.dart';
import 'package:training_5_news_app/view/components/image_from_url.dart';
import 'package:training_5_news_app/view/components/lazy_load_text.dart';
import 'package:training_5_news_app/view/components/page_transformer.dart';

import '../../models/model/news_model.dart';

class HeadLineItem extends StatelessWidget {
  final Article article;
  final PageVisibility pageVisibility;
  final ValueChanged onArticleClicked;


  const HeadLineItem(
      {Key? key,
      required this.article,
      required this.pageVisibility,
      required this.onArticleClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline6;
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () => onArticleClicked(article),
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black87,
                    Colors.black26
                  ]
                ),
              ),
              child: ImageFromUrl(
                imageUrl: article.urlToImage,
              ),
            ),
            Positioned(
              bottom: 50.0,
              left: 30.0,
              right: 30.0,
              child:LazyLoadText(
                text: article.title.toString(),
                pageVisibility: pageVisibility,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
