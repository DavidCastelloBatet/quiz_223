import 'package:flutter/material.dart';

import './restart.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ? ',
      'answers': [
        {'text': 'white', 'score': 1},
        {'text': 'red', 'score': 10},
        {'text': 'green', 'score': 5},
        {'text': 'blue', 'score': 3},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'cat', 'score': 1},
        {'text': 'dog', 'score': 2},
        {'text': 'snake', 'score': 5},
        {'text': 'parrot', 'score': 8},
        {'text': 'lloro', 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your planet ?',
      'answers': [
        {'text': 'terra', 'score': 1},
        {'text': 'mercurio', 'score': 5},
        {'text': 'venus', 'score': 7},
        {'text': 'mart', 'score': 10},
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    print(_totalScore);
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _restartQuest() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Flutter Complete Guide',
            ),
          ),
          body: (_questionIndex > _questions.length - 1)
              ? Restart(
                  restartQuiz: _restartQuest,
                  score: _totalScore,
                )
              : Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )),
    );
  }
}
