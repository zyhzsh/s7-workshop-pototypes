import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;

  const StartScreen({super.key, required this.startQuiz});


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 30),
        const Text(
          'Quiz App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        TextButton.icon(
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
          onPressed: () {startQuiz();},
          icon: const Icon(Icons.start),
          label: const Text('Start Quiz'),
        ),
      ],
    ));
  }
}
