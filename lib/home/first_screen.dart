import 'package:flutter/material.dart';
import 'package:flutter_trivia/question_One/question1.dart';
import 'package:flutter_trivia/q&a/third_screen.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({super.key});

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ignore: prefer_const_constructors
        appBar: CustomAppBar(
          title: 'FLUTTER TRIVIA',
          height: 100,
          backgroundColor: const Color.fromARGB(255, 211, 202, 202),
          gradientStart: Colors.blue,
          gradientEnd: Colors.purple,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
          child: Stack(
            children: [
              //THE TOP CARD
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 25.0),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        const Text(
                          'Quiz of the Day!!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Positioned(
                          top: 35,
                          child: Text(
                            '100 Questions',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 85,
                          child: Text(
                            'Let\'s Start>',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 160,
                          child: Image.asset(
                            'images/dash1.png',
                            scale: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                height: MediaQuery.of(context).size.height * 0.52,
                width: MediaQuery.of(context).size.width,
                top: 190,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 25),
                  child: PietPainting(),
                ),
              ),

              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
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
                          Colors.blue,
                          Color.fromARGB(255, 10, 115, 201),
                          Color.fromARGB(255, 8, 76, 132)
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: (() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return const QuizScreen();
                        })));
                      }),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                            Size(MediaQuery.of(context).size.width * 0.85, 55)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: const Text(
                        'Select Randomly',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 1),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ShortCard extends StatelessWidget {
  const ShortCard(
      {super.key,
      required this.title,
      required this.image,
      required this.color,
      required this.textQuestion});

  final String title;
  final String image;
  final Color color;
  final String textQuestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to quiz screen for the selected category
      },
      child: Container(
        height: MediaQuery.maybeOf(context)!.size.height,
        width: MediaQuery.maybeOf(context)!.size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.face_retouching_off_sharp,
                size: 35,
                color: Color.fromARGB(255, 233, 240, 243),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                textQuestion,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Let\'s Start>',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LongCard extends StatelessWidget {
  const LongCard(
      {super.key,
      required this.title,
      required this.image,
      required this.textQuestion,
      required this.color,
      required this.scale});

  final String title;
  final String image;
  final Color color;
  final String textQuestion;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to quiz screen for the selected category
      },
      child: Container(
        height: MediaQuery.maybeOf(context)!.size.height,
        width: MediaQuery.maybeOf(context)!.size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: const [0.1, 0.9],
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  scale: scale,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    textQuestion,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Let\'s Start>',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PietPainting extends StatelessWidget {
  const PietPainting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 300, // Limit the height of the painting
      child: SingleChildScrollView(
        child: SizedBox(
          width: 400,
          height:
              850, // Set the height to be greater than or equal to the height of the content
          child: LayoutGrid(
            columnGap: 15,
            rowGap: 20,
            areas: '''
               A B 
               A b
               a b
               c C
               c D
               d D
           
            ''',
            // A number of extension methods are provided for concise track sizing
            columnSizes: [
              1.fr,
              1.fr,
            ],
            rowSizes: [0.04.fr, 0.02.fr, 0.04.fr, 0.04.fr, 0.02.fr, 0.04.fr],
            children: [
              // Column 1

              gridArea('A').containing(const LongCard(
                title: 'Responsive Screens',
                image: 'images/icon1.png',
                scale: 5,
                color: Color.fromARGB(255, 109, 226, 255),
                textQuestion: '120 Questions',
              )),
              // Column 3
              gridArea('B').containing(const ShortCard(
                title: 'Widgets',
                image: 'image/image122.jpg',
                color: Color.fromARGB(255, 236, 68, 255),
                textQuestion: '60 Questions',
              )),
              gridArea('a').containing(const ShortCard(
                title: 'APIs',
                image: 'image/image122.jpg',
                color: Color.fromARGB(255, 250, 93, 226),
                textQuestion: '220 Questions',
              )),
              gridArea('a').containing(const ShortCard(
                title: 'APIs',
                image: 'image/image122.jpg',
                color: Color.fromARGB(
                  255,
                  250,
                  93,
                  226,
                ),
                textQuestion: '50 Questions',
              )),
              gridArea('b').containing(const LongCard(
                title: 'State Management',
                image: 'images/icon2.png',
                scale: 6,
                color: Color.fromARGB(255, 97, 88, 252),
                textQuestion: '100 Questions',
              )),
              gridArea('c').containing(const LongCard(
                title: 'Flutter Layout',
                image: 'images/icon3.png',
                scale: 9,
                color: Color.fromARGB(255, 88, 145, 252),
                textQuestion: '120 Questions',
              )),
              gridArea('C').containing(const ShortCard(
                title: 'Hot Reload',
                image: 'images/icon3.png',
                color: Color.fromARGB(255, 224, 93, 250),
                textQuestion: '50 Questions',
              )),
              gridArea('D').containing(const LongCard(
                title: 'Scrollable Views',
                image: 'images/icon4.png',
                scale: 6,
                color: Color.fromARGB(255, 109, 226, 255),
                textQuestion: '50 Questions',
              )),
              gridArea('d').containing(const ShortCard(
                title: 'Flutter UI',
                image: 'image/image122.jpg',
                color: Color.fromARGB(255, 250, 93, 226),
                textQuestion: '50 Questions',
              )),
              // Column 2
            ],
          ),
        ),
      ),
    );
  }
}
