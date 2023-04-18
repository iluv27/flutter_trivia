import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final Color backgroundColor;
  final Color gradientStart;
  final Color gradientEnd;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.height,
    required this.backgroundColor,
    required this.gradientStart,
    required this.gradientEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarClipper2(),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 96, 96, 96).withOpacity(0.6),
              spreadRadius: 4,
              blurRadius: 7,
              offset: const Offset(3, 6), // changes position of shadow
            ),
          ],
        ),
        child: ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [gradientStart, gradientEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            height: height,
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  left: 10,
                  child: IconButton(
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {},
                    icon: const Icon(Icons.app_registration),
                  ),
                ),
                Positioned(
                  top: 26,
                  left: 60,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
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

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 20)
      ..quadraticBezierTo(
          size.width / 1.9, size.height * 0.6, size.width, size.height - 20)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class AppBarClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          size.width / 1.9, size.height * 0.6, size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
