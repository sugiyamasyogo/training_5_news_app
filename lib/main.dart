
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_5_news_app/view/screens/home_screen.dart';
import 'package:training_5_news_app/style/style.dart';
import 'package:training_5_news_app/viewmodels/news_list_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider<NewsListViewModel>(
      create: (context) => NewsListViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NewsFeed",
      home: HomeScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: BoldFont,
      ),
    );
  }
}
