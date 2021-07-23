import 'package:flutter/material.dart';

class Restart extends StatelessWidget {
  final VoidCallback? restartQuiz;
  final int? score;

  Restart({this.restartQuiz, this.score});

  String get resultPrase {
    var resultText;
    if (score! <= 10) {
      resultText = 'Se acabooooo!';
    } else if (score! <= 20) {
      resultText = 'Para yaaaa!';
    } else {
      resultText = 'Fin';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(resultPrase, style: TextStyle(fontSize: 50, color: Colors.blue)),
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: restartQuiz,
          child: Text('Restart'),
        )
      ],
    ));
  }
}
