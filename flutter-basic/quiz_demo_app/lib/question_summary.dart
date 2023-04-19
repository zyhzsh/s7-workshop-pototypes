import 'package:flutter/cupertino.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary({required this.summaryData, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(children: [
              Text(((data['question_index'] as int) +1 ).toString()),
              Expanded(
                child: Column(children: [
                  Text(data['question'].toString()),
                  const SizedBox(height: 5),
                  Text(data['chosen_answer'].toString()),
                  const SizedBox(height: 5),
                  Text(data['correct_answer'].toString()),
                ]),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
