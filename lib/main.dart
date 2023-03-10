// ignore_for_file: library_private_types_in_public_api, implementation_imports

import 'package:flutter/material.dart';
import 'home/load_screen.dart';
import 'home/first_screen.dart';
import 'dart:async';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   loader();
  // }

  // void route() {

  // }

  // Future<Timer> loader() async {
  //   var duration = const Duration(seconds: 5);
  //   return Timer(duration, route);
  // }

  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}
