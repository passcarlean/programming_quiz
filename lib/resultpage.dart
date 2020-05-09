import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  var data;

  @override
  Widget build(BuildContext context) {
   data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "You scored ${data["right"].toString()} / ${data["total"].toString()}",
              
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
