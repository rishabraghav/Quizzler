import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'QuizBrain.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Quizpage(),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  QuizBrain quizBrain = QuizBrain();

  void checkAnswer(bool userPicked) {
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
            context: context,
            title: 'Congratulations',
            desc:
                'You have completed the Quizzler. Click restart to start again.',
            buttons: [
              DialogButton(
                color: Colors.grey.shade800,
                child: Text(
                  'Restart',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () {
                  setState(() {
                    quizBrain.restart();
                    Navigator.pop(context);
                  });
                },
              ),
            ]).show();
        scoreKeeper = [];
      } else {
        if (userPicked == quizBrain.getAnswer()) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              color: Colors.green,
              height: 40.0,
              onPressed: () {
                checkAnswer(true);
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'TRUE',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              height: 40.0,
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'FALSE',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
