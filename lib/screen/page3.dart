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
import 'package:platformchannels/screen/Page3.dart';
import 'package:platformchannels/screen/util.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _HomeState();
}

class _HomeState extends State<Page3> {
  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.io/toast');

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Uri _url_df_footsal = Uri.parse(
      'https://drive.google.com/drive/folders/1Seb3-AJ5EHvZ6m8zMPDNH6GMsfgi7ynF'); // فوتسال

  final Uri _url_df_valibal = Uri.parse(
      'https://drive.google.com/drive/folders/15Bht_Yqu2M1_oC_EbUvEca2aJthP_0vG'); // والیبال

  final Uri _url_df_tenis = Uri.parse(
      'https://drive.google.com/drive/folders/15EOOvZFu0kj9yEhJKzecJ0Kmjtalcyi2'); // تنیس

  @override
  void initState() {
    super.initState();
  }

  Future<void> _launchUrl_df_footsal() async {
    if (!await launchUrl(_url_df_footsal)) {
      throw Exception('$_url_df_footsal باز نمی شود!');
    }
  }

  Future<void> _launchUrl_df_valibal() async {
    if (!await launchUrl(_url_df_valibal)) {
      throw Exception('$_url_df_valibal باز نمی شود!');
    }
  }

  Future<void> _launchUrl_df_tenis() async {
    if (!await launchUrl(_url_df_tenis)) {
      throw Exception('$_url_df_tenis باز نمی شود!');
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
          
مسابقات
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
                                  _launchUrl_df_footsal();
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
                                            "فوتسال",
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
                                  _launchUrl_df_valibal();
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
                                            "والیبال",
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
                                  _launchUrl_df_tenis();
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
                                            "تنیس روی میز",
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
