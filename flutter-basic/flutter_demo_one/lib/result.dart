import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  const Result({super.key, required this.resultScore, required this.resetQuiz});


  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Your final score is: $resultScore', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Text('$resultPhrase',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: resetQuiz,
          ),
        ],

      ),
    );
  }
}
