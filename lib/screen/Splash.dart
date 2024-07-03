import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:platformchannels/screen/home.dart';

void main() {
  runApp(const Splash());
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void timer() {
    int counter = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      counter++;
      print('Counter: $counter');
      if (counter == 2) {
        timer.cancel();
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const Home(),
          ),
        );
      }
    });
  }

  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF001554),
        body: GestureDetector(
          onTap: () => Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const Home(),
            ),
          ),
          child: Stack(children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/splash.png',
                width: double.infinity,
              ).animate(),
            ),
          ]),
        ),
      ),
    );
  }
}
