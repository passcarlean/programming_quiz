import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/quiz.png',
              width: 300,
            ),
            SizedBox(
              height: 40,
            ),
            Text("Welcome to Computer Science Quiz \n Have fun !!"),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
            )
          ],
        ),
      ),
    );
  }
}