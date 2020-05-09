import 'package:flutter/material.dart';
import 'package:programmingquiz/quiz.dart';
import 'package:programmingquiz/welcome_page.dart';
import 'package:programmingquiz/resultpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
      routes: {
        '/quiz': (context) => QuizPage(),
        '/result': (context) => ResultPage()
      },
    );
  }
}
