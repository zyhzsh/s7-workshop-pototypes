import 'package:expense_demo_app/question_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/questions.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;

  const ResultScreen({required this.chosenAnswers, super.key});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['chosen_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('You answered $numberOfCorrectAnswers out of $numberOfTotalQuestions questions correctly!'),
            const SizedBox(height: 30),
            QuestionsSummary(
              summaryData: summaryData,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'data',
                ))
          ],
        ),
      ),
    );
  }
}
