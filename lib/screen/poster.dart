import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:platformchannels/screen/home.dart';

void main() {
  runApp(const Poster());
}

class Poster extends StatefulWidget {
  const Poster({super.key});

  @override
  State<Poster> createState() => _SplashState();
}

class _SplashState extends State<Poster> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Center(
              child: const Text(
                """
          
پوستر مسابقات
""",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Iransans', fontSize: 15, color: Colors.white),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: Color(0xFF001554),
          body: Stack(children: [
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
