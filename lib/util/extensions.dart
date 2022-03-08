import 'package:training_5_news_app/models/db/database.dart';
import 'package:training_5_news_app/models/model/news_model.dart';


///Dartのモデルクラス　=> DBのテーブルクラスに
extension ConvertToArticleRecord on List<Article> {
  List<ArticleRecord> toArticleRecords(List<Article> articles){
    final articleRecords = <ArticleRecord>[];
    articles.forEach((article) {
      articleRecords.add(
        ArticleRecord(
            title: article.title ?? "",
            description: article.description ?? "",
            url: article.url ?? "",
            urlToImage: article.urlToImage ?? "",
            publishDate: article.publishDate ?? "",
            content: article.content ?? "")
      );
    });
    return articleRecords;
  }
}

///　DBのテーブルクラス　=> Dartのモデルクラスに
extension ConvertToArticle on List<ArticleRecord> {
  List<Article> toArticles(List<ArticleRecord> articleRecords){
    final articles = <Article>[];
    articleRecords.forEach((articleRecord) {
      articles.add(
          Article(
              title: articleRecord.title,
              description: articleRecord.description,
              url: articleRecord.url,
              urlToImage: articleRecord.urlToImage,
              publishDate: articleRecord.publishDate,
              content: articleRecord.content)
      );
    });
    return articles;
  }
}