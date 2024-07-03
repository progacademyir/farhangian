import 'package:flutter/material.dart';
import 'package:platformchannels/screen/Splash.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData mytheme = ThemeData(
      fontFamily: 'Iransans',
    );
    return MaterialApp(
      theme: mytheme,
      home: Splash(),
    );
  }
}
