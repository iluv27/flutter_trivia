// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(
            Icons.flip_to_back_outlined,
            color: Colors.blueAccent,
          ),
          title: const Text(
            'Stateful Widgets',
            style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: buildQuizScreen(),
      ),
    );
  }

  int currentQuestionIndex = 0;
  bool quizFinished = false;
  List<String> allAnswers = [
    'Paris',
    'New York City',
    'Tokyo',
    'London',
    'Dubai',
    'Los Angeles',
    'Moscow',
    'Hong Kong',
    'Barcelona',
    'Singapore'
  ];
  List<String> correctAnswers = ['Paris', 'Tokyo', 'Dubai', 'Hong Kong'];

  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the capital city of France?',
      'answers': ['Paris', 'New York City', 'London', 'Barcelona']
    },
    {
      'question': 'What is the capital city of Japan?',
      'answers': ['Tokyo', 'Dubai', 'Los Angeles', 'Moscow']
    },
    {
      'question': 'What is the capital city of the United Arab Emirates?',
      'answers': ['Dubai', 'Hong Kong', 'Singapore', 'Paris']
    },
    {
      'question': 'What is the capital city of China?',
      'answers': ['Hong Kong', 'Moscow', 'Barcelona', 'New York City']
    }
  ];

  List<String> selectedAnswers = List.filled(4, '');

  void onAnswerSelected(String answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;

      if (currentQuestionIndex == questions.length - 1) {
        quizFinished = true;
      } else {
        currentQuestionIndex++;
      }
    });
  }

  void onReset() {
    setState(() {
      currentQuestionIndex = 0;
      quizFinished = false;
      selectedAnswers = List.filled(4, '');
    });
  }

  Widget buildQuizScreen() {
    final question = questions[currentQuestionIndex];
    final answers = question['answers'];

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Text(
            'Question ${currentQuestionIndex + 1}/${questions.length}',
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 167, 169, 38)),
          ),
          const SizedBox(height: 20),
          Text(
            question['question'],
            style: const TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 20),
          for (var answer in answers)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () => onAnswerSelected(answer),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      selectedAnswers[currentQuestionIndex] == answer
                          ? MaterialStateProperty.all(Colors.green)
                          : null,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Text(answer),
              ),
            ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            width: 100,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 130.0, vertical: 8),
              child: CircularProgressIndicator(
                value: currentQuestionIndex / (questions.length - 1),
                strokeWidth: 10,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => onAnswerSelected(''),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Skip'),
          ),
        ],
      ),
    );
  }

  Widget buildFinishedScreen() {
    int correctAnswersCount = 0;

    for (var i = 0; i < questions.length; i++) {
      if (correctAnswers.contains(selectedAnswers[i])) {
        correctAnswersCount++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quiz Completed!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'You answered $correctAnswersCount out of ${questions.length} questions correctly.',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                onReset();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => buildQuizScreen()),
                );
              },
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

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
