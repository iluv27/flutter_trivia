import 'package:flutter/material.dart';
import 'third_screen.dart';
import 'quiz_sect.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // THE APP BAR
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
                  child: BuildQuizScreen(),
                ),
              ),
            ),
          ],
        ));
  }
}

class BuildQuizScreen extends StatefulWidget {
  const BuildQuizScreen({super.key});

  @override
  State<BuildQuizScreen> createState() => _BuildQuizScreenState();
}

class _BuildQuizScreenState extends State<BuildQuizScreen> {
  bool quizFinished = false;

  List<String> selectedAnswers = List.filled(5, '');

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

  @override
  Widget build(BuildContext context) {
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
                questions[currentQuestionIndex]['question'],
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(169, 0, 0, 0)),
              ),
            ),
            for (var answer in questions[currentQuestionIndex]['answers'])
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
                      return const BuildFinishedScreen();
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
}

class BuildFinishedScreen extends StatefulWidget {
  const BuildFinishedScreen({super.key});

  @override
  State<BuildFinishedScreen> createState() => _BuildFinishedScreenState();
}

class _BuildFinishedScreenState extends State<BuildFinishedScreen> {
  int correctAnswersCount = 0;

  List<String> selectedAnswers = List.filled(5, '');
  bool quizFinished = false;

  void onReset() {
    setState(() {
      currentQuestionIndex = 0;
      quizFinished = false;
      selectedAnswers = List.filled(4, '');
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height * 0.5,
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
                padding: const EdgeInsets.only(top: 200.0, left: 15, right: 15),
                child: Container(
                  height: 400,
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
                  child: Center(
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
                        Container(
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
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
                              // Navigator.pushReplacement(context,
                              //     MaterialPageRoute(builder: ((context) {
                              //   return const BuildQuizScreen();
                              // })));
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: const Size(200, 60),
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(18),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Restart Quiz',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
