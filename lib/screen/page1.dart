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
import 'package:platformchannels/screen/page1.dart';
import 'package:platformchannels/screen/util.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _HomeState();
}

class _HomeState extends State<Page1> {
  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.io/toast');

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Uri _url_h_mizban = Uri.parse(
      'https://www.google.com/maps/place/Razavi+Khorasan+Province,+Mashhad,+Emam+Reza+Blvd,+No.+40,+Mizban+Hotel,+Iran/@36.2700357,59.6025187,16z/data=!4m6!3m5!1s0x3f6c96d3f12868bd:0x84e643a4e9eb0ef6!8m2!3d36.2700357!4d59.6025187!16s/g/11b61rw459'); // هتل میزبان

  final Uri _url_h_hadis = Uri.parse(
      'https://www.google.com/maps/place/مشهد،،+استان+خراسان+رضوی،،+امام+رضا+42،،+7J92+MV8+Hadis+Hotel,+Iran/@36.2691643,59.6022074,16z/data=!4m6!3m5!1s0x3f6c97a826e55bf9:0x35ecaff2ca5c56ab!8m2!3d36.2691643!4d59.6022074!16s/g/11h8_v1_73'); // هتل حدیث

  final Uri _url_h_ghasedak = Uri.parse(
      'https://www.google.com/maps/place/36°16\'18.7\"N+59°36\'03.2\"E/@36.2728262,59.6028582,16z/data=!4m4!3m3!8m2!3d36.2718539!4d59.600882'); // هتل قاصدک

  final Uri _url_h_jam = Uri.parse(
      'https://www.google.com/maps/place/Razavi+Khorasan+Province,+Mashhad,+Pasdaran+Ave,+7HQW+7FC+Jam+Hotel,+Iran/@36.2881852,59.5961463,16z/data=!4m6!3m5!1s0x3f6c913d06d66951:0xd29e40a7ae2f5031!8m2!3d36.2881852!4d59.5961463!16s/g/1v3hyg7r'); // هتل جم

  final Uri _url_h_hamta = Uri.parse(
      'https://www.google.com/maps/place/Hamta+Hotel,+7HQW+C72,+Mashhad,+Razavi+Khorasan+Province,+Iran/@36.2885218,59.5956526,16z/data=!4m6!3m5!1s0x3f6c91b534ab3615:0x62c042afb2ed91d5!8m2!3d36.2885218!4d59.5956526!16s/g/11hdzslhm9'); // هتل همتا

  final Uri _url_h_ziafat = Uri.parse(
      'https://www.google.com/maps/place/Razavi+Khorasan+Province,+Mashhad,+شهر,+خیابان+سرشور,+No.+نبش,+هتل+۳+ستاره+ضیافت+نور,+سرشور+۲۸,+Iran/@36.2832151,59.6051255,16z/data=!4m6!3m5!1s0x3f6c8d0061724e7d:0x309e84056363d00f!8m2!3d36.2832151!4d59.6051255!16s/g/11w1lm61pv'); // هتل ضیافت النور

  final Uri _url_nh_mizban =
      Uri.parse('https://nshn.ir/49sb1xAZNJjirw'); // هتل میزبان

  final Uri _url_nh_hadis =
      Uri.parse('https://nshn.ir/sb1xStGJjiui'); // هتل حدیث

  final Uri _url_nh_ghasedak =
      Uri.parse('https://nshn.ir/71sb1xiPIJj-No'); // هتل قاصدک

  final Uri _url_nh_jam = Uri.parse('https://nshn.ir/e8sb1jhpIJjA_o'); // هتل جم

  final Uri _url_nh_hamta =
      Uri.parse('https://nshn.ir/1dsb1jXzNJjLha'); // هتل همتا

  final Uri _url_nh_ziafat =
      Uri.parse('https://nshn.ir/2fsb1GLxOJjyoj'); // هتل ضیافت النور

  @override
  void initState() {
    super.initState();
  }

  Future<void> _launchUrl_h_mizban() async {
    if (!await launchUrl(_url_h_mizban)) {
      throw Exception('$_url_h_mizban باز نمی شود!');
    }
  }

  Future<void> _launchUrl_h_hadis() async {
    if (!await launchUrl(_url_h_hadis)) {
      throw Exception('$_url_h_hadis باز نمی شود!');
    }
  }

  Future<void> _launchUrl_h_ghasedak() async {
    if (!await launchUrl(_url_h_ghasedak)) {
      throw Exception('$_url_h_ghasedak باز نمی شود!');
    }
  }

  Future<void> _launchUrl_h_jam() async {
    if (!await launchUrl(_url_h_jam)) {
      throw Exception('$_url_h_jam باز نمی شود!');
    }
  }

  Future<void> _launchUrl_h_hamta() async {
    if (!await launchUrl(_url_h_hamta)) {
      throw Exception('$_url_h_hamta باز نمی شود!');
    }
  }

  Future<void> _launchUrl_h_ziafat() async {
    if (!await launchUrl(_url_h_ziafat)) {
      throw Exception('$_url_h_ziafat باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nh_mizban() async {
    if (!await launchUrl(_url_nh_mizban)) {
      throw Exception('$_url_nh_mizban باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nh_hadis() async {
    if (!await launchUrl(_url_nh_hadis)) {
      throw Exception('$_url_nh_hadis باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nh_ghasedak() async {
    if (!await launchUrl(_url_nh_ghasedak)) {
      throw Exception('$_url_nh_ghasedak باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nh_jam() async {
    if (!await launchUrl(_url_nh_jam)) {
      throw Exception('$_url_nh_jam باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nh_hamta() async {
    if (!await launchUrl(_url_nh_hamta)) {
      throw Exception('$_url_nh_hamta باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nh_ziafat() async {
    if (!await launchUrl(_url_nh_ziafat)) {
      throw Exception('$_url_nh_ziafat باز نمی شود!');
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
          
محل اسکان
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
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'فوتسال: هتل میزبان ، امام رضا 40',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_h_mizban();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در گوگل مپ',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_nh_mizban();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در نشان',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                ))
                                          ],
                                        );
                                      });
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
                                            "فوتسال: هتل میزبان",
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
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'فوتسال: هتل حدیث ، امام رضا 42',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_h_hadis();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در گوگل مپ',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_nh_hadis();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در نشان',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                )),
                                          ],
                                        );
                                      });
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
                                            "فوتسال: هتل حدیث",
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
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'فوتسال: هتل قاصدک ، امام رضا 33',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_h_ghasedak();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در گوگل مپ',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_nh_ghasedak();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در نشان',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                ))
                                          ],
                                        );
                                      });
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
                                            "فوتسال: هتل قاصدک",
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
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'والیبال: هتل جم ، خیابان پاسداران ، بین پاسداران 4 و 4/1',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_h_jam();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در گوگل مپ',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_nh_jam();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در نشان',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                ))
                                          ],
                                        );
                                      });
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
                                            "والیبال: هتل جم",
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
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'والیبال: هتل همتا ، خیابان پاسداران ، نبش پاسداران 4/1',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_h_hamta();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در گوگل مپ',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_nh_hamta();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در نشان',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                ))
                                          ],
                                        );
                                      });
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
                                            "والیبال: هتل همتا",
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
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'تنیس روی میز: هتل ضیافت النور ، خیابان سرشور ، نبش سرشور 28',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_h_ziafat();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در گوگل مپ',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_nh_ziafat();
                                                },
                                                child: Text(
                                                  'مشاهده آدرس در نشان',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                ))
                                          ],
                                        );
                                      });
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
                                            "تنیس روی میز: هتل ضیافت النور",
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
                      ]),
                    )))));
  }
}
