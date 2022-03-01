import 'package:flutter/material.dart';
import 'package:training_5_news_app/screens/home_screen.dart';
import 'package:training_5_news_app/style/style.dart';

void main() => runApp(MyApp());

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


