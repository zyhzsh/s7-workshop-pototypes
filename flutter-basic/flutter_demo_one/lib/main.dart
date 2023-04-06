import 'package:flutter/material.dart';
import 'package:flutter_demo_one/quiz.dart';
import 'package:flutter_demo_one/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What is your favorite fruit?',
      'answers': [
        {
          'text': 'Apple',
          'score': 3,
        },
        {
          'text': 'Banana',
          'score': 5,
        },
        {
          'text': 'Orange',
          'score': 4,
        },
        {
          'text': 'Grapes',
          'score': 2,
        },
      ],
    },
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {
          'text': 'Red',
          'score': 3,
        },
        {
          'text': 'Blue',
          'score': 5,
        },
        {
          'text': 'Green',
          'score': 4,
        },
        {
          'text': 'Yellow',
          'score': 2,
        },
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {
          'text': 'Dog',
          'score': 3,
        },
        {
          'text': 'Cat',
          'score': 5,
        },
        {
          'text': 'Lion',
          'score': 4,
        },
        {
          'text': 'Tiger',
          'score': 2,
        },
      ],
    },
    {
      'questionText': 'What is your favorite car?',
      'answers': [
        {
          'text': 'BMW',
          'score': 3,
        },
        {
          'text': 'Audi',
          'score': 5,
        },
        {
          'text': 'Mercedes',
          'score': 4,
        },
        {
          'text': 'Lamborghini',
          'score': 2,
        },
      ],
    },
    {
      'questionText': 'What is your favorite country?',
      'answers': [
        {
          'text': 'India',
          'score': 3,
        },
        {
          'text': 'USA',
          'score': 5,
        },
        {
          'text': 'UK',
          'score': 4,
        },
        {
          'text': 'Japan',
          'score': 2,
        },
      ],
    }
  ];
  var _totalScore = 0;
  var _questionIndex = 0;

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: _questionIndex < _questions.length
                ? Quiz(
                    questionIndex: _questionIndex,
                    questions: _questions,
                    answerQuestion: _answerQuestion)
                : Result(
                    resultScore: _totalScore,
                    resetQuiz: _resetQuiz,
                  )),
      ),
    );
  }
}
