import 'package:expense_demo_app/questions_screen.dart';
import 'package:expense_demo_app/result_screen.dart';
import 'package:expense_demo_app/start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
    });
    if(selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers=[];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuiz: switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onChooseAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
