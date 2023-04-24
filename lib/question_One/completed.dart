// ignore_for_file: must_be_immutable, no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trivia/home/first_screen.dart';
import 'package:flutter_trivia/question_One/question1.dart';
import '../q&a/third_screen.dart';
import '../q&a/quiz_sect.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildFinishedScreen extends StatefulWidget {
  BuildFinishedScreen(
      {super.key,
      required this.selectedAnswers,
      required this.questionQuestion,
      required this.questionTitle});

  List<String>? selectedAnswers;
  String questionTitle;
  final List<Map<String, dynamic>> questionQuestion;

  @override
  State<BuildFinishedScreen> createState() => _BuildFinishedScreenState();
}

class _BuildFinishedScreenState extends State<BuildFinishedScreen> {
  int correctAnswersCount = 0;

  bool quizFinished = false;

  void onReset() {
    setState(() {
      currentQuestionIndex = 0;
      quizFinished = false;
      // selectedAnswers = List.filled(5, '');
    });
  }

  @override
  Widget build(BuildContext context) {
    for (var answer = 0; answer < widget.questionQuestion.length; answer++) {
      // ignore: avoid_print

      if (widget.questionQuestion[answer]['correctAnswer'] ==
          widget.selectedAnswers![answer]) {
        correctAnswersCount++;
      } else {
        correctAnswersCount;
      }
    }

    final Uri _url =
        Uri.parse('https://www.linkedin.com/in/joy-ehiedu-49a163188');

    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Scaffold(
        bottomSheet: Container(
          height: 45,
          width: double.infinity,
          color: const Color.fromARGB(255, 104, 0, 125),
          child: GestureDetector(
            onTap: () {
              _launchUrl();
            },
            child: Center(
              child: RichText(
                text: const TextSpan(
                  text: '© copyright | ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                  children: [
                    TextSpan(
                      text: 'Joy Ehiedu',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) {
                return const QuizHomeScreen();
              })));
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
              top: 120,
              left: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                children: const [
                  Text(
                    'Congrats!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: 'Pacifico'),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 250.0, left: 15, right: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 300,
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
                        const SizedBox(height: 20.0),
                        const Divider(
                          height: 10,
                          thickness: 1,
                          color: Colors.black38,
                        ),
                        const SizedBox(height: 15.0),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              QuizDec(
                                color: Colors.blueGrey,
                                iconData: Icons.grade,
                                quizDecTitle: 'Total',
                                quizDecScore:
                                    '${widget.questionQuestion.length}',
                              ),
                              const P_VerticalDivider(),
                              QuizDec(
                                color: const Color.fromARGB(255, 26, 197, 31),
                                iconData: Icons.check,
                                quizDecTitle: 'Right',
                                quizDecScore: '$correctAnswersCount',
                              ),
                              const P_VerticalDivider(),
                              QuizDec(
                                color: Colors.red,
                                iconData: Icons.close,
                                quizDecTitle: 'Wrong',
                                quizDecScore:
                                    '${widget.questionQuestion.length - correctAnswersCount}',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const Divider(
                          height: 10,
                          thickness: 1,
                          color: Colors.black38,
                        ),
                        const SizedBox(height: 35.0),
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
                              widget.selectedAnswers = [];
                              currentQuestionIndex = 0;
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: ((context) {
                                return QuizScreen(
                                  questionTitle: widget.questionTitle,
                                  questionQuestion: widget.questionQuestion,
                                );
                              })));
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: const Size(200, 55),
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

// ignore: camel_case_types
class P_VerticalDivider extends StatelessWidget {
  const P_VerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      width: 15,
      thickness: 1,
      color: Color.fromARGB(255, 90, 90, 90),
    );
  }
}

class QuizDec extends StatelessWidget {
  const QuizDec(
      {super.key,
      required this.color,
      required this.iconData,
      required this.quizDecScore,
      required this.quizDecTitle});

  final IconData iconData;
  final Color color;
  final String quizDecTitle;
  final String quizDecScore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color: color,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              quizDecTitle,
              style: const TextStyle(color: Colors.black54),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          quizDecScore,
          style: TextStyle(
              color: color, fontWeight: FontWeight.w800, fontSize: 16),
        )
      ],
    );
  }
}
