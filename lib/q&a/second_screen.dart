// ignore_for_file: library_private_types_in_public_api, unused_local_variable

import 'package:flutter/material.dart';
import 'third_screen.dart';

// void onAnswerSelected(String answer) {
//   setState(() {
//     selectedAnswers[currentQuestionIndex] = answer;

//     if (currentQuestionIndex == questions.length - 1) {
//       quizFinished = true;
//     } else {
//       currentQuestionIndex++;
//     }
//   });
// }

// void onQuizFinished(String answer) {
//   setState(() {
//     selectedAnswers[currentQuestionIndex] = answer;

//     if (currentQuestionIndex == questions.length - 1) {
//       quizFinished = true;
//     } else if (currentQuestionIndex != questions.length) {
//       currentQuestionIndex++;
//     } else if (currentQuestionIndex == questions.length) {
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: ((context) {
//         return buildFinishedScreen();
//       })));
//     }
//   });
// }

// onQuizFinished('');
// if (currentQuestionIndex == questions.length + 1) {
//   quizFinished = true;

// } else {}

// THIS IS THE QUIZ RESULTS SCREEN

class ResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<String> selectedAnswers;
  final List<String> correctAnswers;
  final VoidCallback onReset;

  const ResultsScreen({
    Key? key,
    required this.score,
    required this.totalQuestions,
    required this.selectedAnswers,
    required this.correctAnswers,
    required this.onReset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You scored $score out of $totalQuestions!',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onReset,
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
