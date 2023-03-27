// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'third_screen.dart';
import 'dart:math' as math;

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 233, 107, 255),
                Color.fromARGB(255, 87, 52, 184),
                Color.fromARGB(255, 69, 28, 181)
              ],
            ),
          )),
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.api_outlined,
                color: Colors.white,
              ),
            ),
          ],
          title: const Center(
            child: Text(
              'Stateful Widgets',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              child: ClipPath(
                clipper: AppBarClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.56,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 69, 28, 181),
                        Color.fromARGB(255, 233, 107, 255),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 15, right: 15),
                child: Container(
                  height: 530,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: buildQuizScreen(),
                ),
              ),
            ),
          ],
        ));
  }

  int currentQuestionIndex = 0;
  bool quizFinished = false;

  List<String> correctAnswers = [
    'Paris',
    'Tokyo',
    'Dubai',
    'Hong Kong',
    'Moscow'
  ];

  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the meaning of Flutter?',
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
    },
    {
      'question': 'What is the capital city of China?',
      'answers': ['Hong Kong', 'Moscow', 'Barcelona', 'New York City']
    }
  ];

  List<String> selectedAnswers = List.filled(5, '');

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

  void onQuizFinished(String answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;

      if (currentQuestionIndex == questions.length - 1) {
        quizFinished = true;
      } else if (currentQuestionIndex != questions.length) {
        currentQuestionIndex++;
      } else if (currentQuestionIndex == questions.length) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) {
          return buildFinishedScreen();
        })));
      }
    });
  }

  void onAnswerSelected2(answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;

      if (currentQuestionIndex == questions.length - 1) {
        quizFinished = true;
      } else {
        MaterialStateProperty.all(Colors.red);
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

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${currentQuestionIndex + 1}/${questions.length}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(210, 38, 169, 138)),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      backgroundColor: const Color.fromARGB(92, 99, 216, 99),
                      value: currentQuestionIndex / (questions.length - 1),
                      strokeWidth: 4,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 99, 216, 99)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                question['question'],
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(169, 0, 0, 0)),
              ),
            ),
            const SizedBox(height: 20),
            for (var answer in answers)
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 30, right: 30),
                child: ElevatedButton(
                  onPressed: (() {
                    onAnswerSelected2(answer);
                  }),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 50)),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        selectedAnswers[currentQuestionIndex] == answer
                            ? MaterialStateProperty.all(Colors.green)
                            : MaterialStateProperty.all(
                                const Color.fromARGB(255, 228, 228, 228)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Text(
                    answer,
                    style: const TextStyle(
                        color: Color.fromARGB(227, 41, 38, 38),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18)),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 69, 28, 181),
                  Color.fromARGB(255, 233, 107, 255),
                ],
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentQuestionIndex == questions.length - 1) {
                    // quizFinished = true;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) {
                      return buildFinishedScreen();
                    })));
                  } else if (currentQuestionIndex != questions.length) {
                    currentQuestionIndex++;
                  }
                });

                // onQuizFinished('');
                // if (currentQuestionIndex == questions.length + 1) {
                //   quizFinished = true;

                // } else {}
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                minimumSize: const Size(384, 60),
                backgroundColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18)),
                ),
              ),
              child: const Text(
                'Next Question',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
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
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 233, 107, 255),
              Color.fromARGB(255, 87, 52, 184),
              Color.fromARGB(255, 69, 28, 181)
            ],
          ),
        )),
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.api_outlined,
              color: Colors.white,
            ),
          ),
        ],
        title: const Center(
          child: Text(
            'Quiz Results',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
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
