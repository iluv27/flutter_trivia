import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../q&a/second_screen.dart';
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
          height: 120,
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
                  height: MediaQuery.of(context).size.height * 0.2,
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
                    padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        const Text(
                          'Quiz of the Day,',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Positioned(
                          top: 30,
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
                          top: 90,
                          child: Text(
                            'Let\'s Start>',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 20,
                          child: Image.asset(
                            'images/dash1.png',
                            scale: 4,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                height: MediaQuery.of(context).size.height * 0.47,
                width: MediaQuery.of(context).size.width,
                top: 210,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: PietPainting(),
                ),
              ),

              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 77, 146, 188),
                          Color.fromARGB(255, 76, 160, 193)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(15),
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
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(1),
                      ),
                      child: const Text(
                        'Choose Quiz',
                        style: TextStyle(fontSize: 18),
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
  const ShortCard({super.key, required this.title, required this.image});

  final String title;
  final String image;

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
          color: Colors.yellow,
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.face_retouching_off_sharp,
                size: 30,
                color: Colors.lightBlueAccent,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '130 Questions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                'Let\'s Start>',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
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
  const LongCard({super.key, required this.title, required this.image});

  final String title;
  final String image;

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
          color: Colors.green,
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
        child: Container(
          height: 200,
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.face_retouching_off_sharp,
                  size: 40,
                  color: Colors.lightBlueAccent,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '130 Questions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Let\'s Start>',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
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

const cellRed = Color(0xffc73232);
const cellMustard = Color(0xffd7aa22);
const cellBlue = Color(0xff1553be);

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
              gridArea('d').containing(Container(color: cellRed)),
              gridArea('C').containing(Container(color: cellMustard)),
              gridArea('c').containing(Container(color: cellBlue)),
              // Column 2
              gridArea('b').containing(
                  LongCard(title: 'title', image: 'image/image122.jpg')),
              gridArea('A').containing(
                  LongCard(title: 'title', image: 'image/image122.jpg')),
              // Column 3
              gridArea('B').containing(
                  ShortCard(title: 'title', image: 'image/image122.jpg')),
              gridArea('a').containing(
                  ShortCard(title: 'title', image: 'image/image122.jpg')),
              gridArea('a').containing(
                  ShortCard(title: 'title', image: 'image/image122.jpg')),
            ],
          ),
        ),
      ),
    );
  }
}
