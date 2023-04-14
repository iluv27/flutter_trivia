import 'package:flutter/material.dart';
import '../q&a/third_screen.dart';
import '../q&a/quiz_sect.dart';
import 'completed.dart';
import 'package:flutter_trivia/home/first_screen.dart';

// ignore: must_be_immutable
class QuizScreen extends StatefulWidget {
  QuizScreen({super.key});

  List<String> selectedAnswers = [];

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
              widget.selectedAnswers = [];
              currentQuestionIndex = 0;
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
                    height: 550,
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
                    child: BuildQuizScreen(
                      selectedAnswers: widget.selectedAnswers,
                    )),
              ),
            ),
          ],
        ));
  }
}

class BuildQuizScreen extends StatefulWidget {
  const BuildQuizScreen({super.key, required this.selectedAnswers});
  final List<String> selectedAnswers;
  @override
  State<BuildQuizScreen> createState() => _BuildQuizScreenState();
}

class _BuildQuizScreenState extends State<BuildQuizScreen> {
  bool _isButtonEnabled = false;

  final Gradient _disabledButtonColor = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(164, 69, 28, 181),
      Color.fromARGB(162, 233, 107, 255),
    ],
  );

  final Gradient _enabledButtonColor = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 69, 28, 181),
      Color.fromARGB(255, 233, 107, 255),
    ],
  );

  MaterialStateProperty<Color> buttonSelectedColor(answer) {
    setState(() {
      if (questions[currentQuestionIndex]['correctAnswer'] == answer) {
        MaterialStateProperty.all(Colors.green);
      } else if (questions[currentQuestionIndex]['correctAnswer'] == answer) {
        MaterialStateProperty.all(Colors.red);
      }
    });
    return MaterialStateProperty.all(const Color.fromARGB(255, 228, 228, 228));
  }

  void answerCorrection() {
    setState(() {
      if (currentQuestionIndex == questions.length - 1) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) {
          return BuildFinishedScreen(
            selectedAnswers: widget.selectedAnswers,
          );
        })));
      } else if (currentQuestionIndex != questions.length) {
        currentQuestionIndex++;
      }
      _isButtonEnabled = false;
    });
    // ignore: avoid_print
    print(widget.selectedAnswers);
  }

  void _buttonEnabled() {
    setState(() {
      _isButtonEnabled ? answerCorrection() : null;
    });
  }

  // List<String> selectedAnswers = List.filled(5, '');

  void onAnswerSelected2(String answer) {
    setState(() {
      _isButtonEnabled = true;
      // selectedAnswers[currentQuestionIndex] = answer;
      widget.selectedAnswers.add(answer);
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
                      strokeWidth: 4.5,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 99, 216, 99)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  questions[currentQuestionIndex]['question'],
                  style: const TextStyle(
                    height: 1.4,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(169, 0, 0, 0),
                  ),
                ),
              ),
            ),
            for (var answer in questions[currentQuestionIndex]['answers'])
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 30, right: 30),
                child: ElevatedButton(
                  onPressed: () {
                    onAnswerSelected2(answer);
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 60)),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        widget.selectedAnswers[currentQuestionIndex] ==
                                questions[currentQuestionIndex]['answers']
                            ? MaterialStateProperty.all<Color>(Colors.green)
                            : MaterialStateProperty.all<Color>(Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10),
                      child: Text(
                        answer,
                        style: const TextStyle(
                            height: 1.4,
                            color: Color.fromARGB(227, 41, 38, 38),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18)),
              ),
              gradient:
                  _isButtonEnabled ? _enabledButtonColor : _disabledButtonColor,
            ),
            child: ElevatedButton(
              onPressed: _buttonEnabled,
              style: ButtonStyle(
                enableFeedback: _isButtonEnabled,
                elevation: MaterialStateProperty.all<double>(0),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(384, 60)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18)),
                  ),
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
