import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


  class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
  }
class _QuizPageState extends State<QuizPage> {
  var questions = [];
  int index = 0;


  int rightAnswerCount = 0;
  int wrongAnswerCount = 0;
  Color right= Colors.green;
  Color wrong = Colors.red;

  @override
  void initState() {
  
    super.initState();
    this.setAsset();
  }

  setAsset() {
     String assettoload = "assets/general_question.json";
    http.get(assettoload).then((res) {
    var resp = jsonDecode(res.body);
    setState(() {
        questions = resp["questions"];
    });
  }).catchError((err) {
  print(err);
  });
}
  validate(i) {
    if (questions[index]["correctIndex"] == i) {

      setState(() {

        rightAnswerCount++;
      });
    } else {

      setState(() {

        wrongAnswerCount++;
      });
    }

    if (index < questions.length - 1) {
      setState(() {
        index++;
      });
    } else {
      Navigator.pushNamed(context, '/result', arguments: {
        'right': rightAnswerCount,
        'wrong': rightAnswerCount,
        'total': questions.length
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: questions.length != 0
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              questions[index]["question"],
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 12,
            ),
            RaisedButton(
              onPressed: () => validate(0),
              child: Text(questions[index]["options"][0]),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () => validate(1),
              child: Text(questions[index]["options"][1]),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () => validate(2),
              color: Colors.blue,
              child: Text(questions[index]["options"][2]),
            ),
            RaisedButton(
              onPressed: () => validate(3),
              color: Colors.blue,
              child: Text(questions[index]["options"][3]),
            ),
          ],
        ),
      )
          : Container(),
    );
  }
}
