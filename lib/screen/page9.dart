// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs, avoid_print

import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:platformchannels/db/dbhandler.dart';
import 'package:platformchannels/db/devices.dart';
import 'package:platformchannels/db/users.dart';
import 'package:platformchannels/screen/Splash.dart';
import 'package:platformchannels/screen/Page9.dart';
import 'package:platformchannels/screen/util.dart';

class Page9 extends StatefulWidget {
  const Page9({super.key});

  @override
  State<Page9> createState() => _HomeState();
}

class _HomeState extends State<Page9> {
  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.io/toast');

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Uri _url_ziarat =
      Uri.parse('https://www.aparat.com/v/dtIMH'); // آداب زیارت

  final Uri _url_mashhad = Uri.parse(
      'https://drive.google.com/file/d/1Y7ZgabE_PRWLVVuVvU8IupcpogBKVn_j/view?usp=drivesdk'); // مشهدگردی

  final Uri _url_tvalibal = Uri.parse(
      'https://drive.google.com/file/d/1-RnXBxiWArwpoOOjnLacncPNkZTTIBC4/view?usp=drive_link'); // تاریخچه والیبال

  final Uri _url_ttenis = Uri.parse(
      'https://drive.google.com/file/d/1-Th-TavJNAJfIy5kJObPjwrAQzRJcy_r/view?usp=drive_link'); // تاریخچه تنیس

  final Uri _url_tanz = Uri.parse(
      'https://drive.google.com/file/d/1uEMZSM6-TQKqLpUXCnL5IB6EHAc5Q5r5/view?usp=drivesdk'); // طنز

  @override
  void initState() {
    super.initState();
  }

  Future<void> _launchUrl_ziarat() async {
    if (!await launchUrl(_url_ziarat)) {
      throw Exception('$_url_ziarat باز نمی شود!');
    }
  }

  Future<void> _launchUrl_mashhad() async {
    if (!await launchUrl(_url_mashhad)) {
      throw Exception('$_url_mashhad باز نمی شود!');
    }
  }

  Future<void> _launchUrl_tvalibal() async {
    if (!await launchUrl(_url_tvalibal)) {
      throw Exception('$_url_tvalibal باز نمی شود!');
    }
  }

  Future<void> _launchUrl_ttenis() async {
    if (!await launchUrl(_url_ttenis)) {
      throw Exception('$_url_ttenis باز نمی شود!');
    }
  }

  Future<void> _launchUrl_tanz() async {
    if (!await launchUrl(_url_tanz)) {
      throw Exception('$_url_tanz باز نمی شود!');
    }
  }
  /////////////////// Toast & ScaffoldText /////////////////

  void Toast(var message) async {
    await methodChannel.invokeMethod('getToast', {"message": message});
  }

/////////////////////////// DATABASE ////////////////////

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Iransans'),
        home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: Center(
                    child: const Text(
                      """
          
خواندنی ها
""",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Iransans',
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                body: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _launchUrl_ziarat();
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: Colors.black38, width: 1)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.file_copy),
                                          Text(
                                            "آداب زیارت",
                                            style: TextStyle(
                                                fontFamily: 'Iransans'),
                                          ),
                                          Icon(Icons.arrow_right_outlined),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _launchUrl_mashhad();
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: Colors.black38, width: 1)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.file_copy),
                                          Text(
                                            "مشهد گردی",
                                            style: TextStyle(
                                                fontFamily: 'Iransans'),
                                          ),
                                          Icon(Icons.arrow_right_outlined),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _launchUrl_tvalibal();
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: Colors.black38, width: 1)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.file_copy),
                                          Text(
                                            "تاریخچه رشته والیبال",
                                            style: TextStyle(
                                                fontFamily: 'Iransans'),
                                          ),
                                          Icon(Icons.arrow_right_outlined),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _launchUrl_ttenis();
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: Colors.black38, width: 1)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.file_copy),
                                          Text(
                                            "تاریخچه رشته تنیس روی میز",
                                            style: TextStyle(
                                                fontFamily: 'Iransans'),
                                          ),
                                          Icon(Icons.arrow_right_outlined),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _launchUrl_tanz();
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: Colors.black38, width: 1)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.file_copy),
                                          Text(
                                            "طنز",
                                            style: TextStyle(
                                                fontFamily: 'Iransans'),
                                          ),
                                          Icon(Icons.arrow_right_outlined),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                    )))));
  }
}
