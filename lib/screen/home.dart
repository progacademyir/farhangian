// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs, avoid_print

import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:platformchannels/db/dbhandler.dart';
import 'package:platformchannels/db/devices.dart';
import 'package:platformchannels/db/users.dart';
import 'package:platformchannels/screen/Splash.dart';
import 'package:platformchannels/screen/page1.dart';
import 'package:platformchannels/screen/page3.dart';
import 'package:platformchannels/screen/page4.dart';
import 'package:platformchannels/screen/page9.dart';
import 'package:platformchannels/screen/poster.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.io/toast');

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Uri _url_meskan = Uri.parse('https://goo.gl/maps/3Tks9avk44Khi5Du7');
  final Uri _url_meftetahie = Uri.parse(
      'https://www.google.com/maps/place/Razavi+Khorasan+Province,+Mashhad،+امام+خمینی+25,+Emam+Khomeini,+No.+گلستان،+ساختمان+صبا,+Iran/@36.290158,59.5983687,16z/data=!4m6!3m5!1s0x3f6c913d4dd91479:0x7c0feec79c06f8bc!8m2!3d36.290158!4d59.5983687!16s/g/11b77b9jkx');

  final Uri _url_nmeftetahie = Uri.parse('https://nshn.ir/a9sb1jCO2JjFts');

  final Uri _url_arzyabi = Uri.parse('https://formafzar.com/form/4jndi');

  final Uri _url_nazarsanji = Uri.parse('https://formafzar.com/form/064bp');

  final Uri _url_film = Uri.parse(
      'https://drive.google.com/drive/folders/1-mO5I6Kq2diY-502wSxmBSm5GHq03-wK');

  final Uri _url_gallery = Uri.parse(
      'https://drive.google.com/drive/folders/1-dLYfcz-ycnAY7T7I5o1RSHgc53LxTWx');

  final Uri _url_instagram =
      Uri.parse('https://www.instagram.com/t.b.khedu?igsh=dWhlM2x6YWJvdHhz');

  final Uri _url_farhangi = Uri.parse(
      'https://drive.google.com/drive/folders/1-mqBOqm8RQ_J4ey9gM6-bdBXpWhhE1F8');

  final Uri _url_akhbar = Uri.parse(
      'https://drive.google.com/drive/folders/1-r0NhRDlRIP8tS1VyVLgw2_SXs27oNqA');

  final Uri _url_khandani = Uri.parse(
      'https://drive.google.com/drive/folders/1-zjT6cQfz8yB7tB3_2CpZR0iXETwpEqe');

  @override
  void initState() {
    super.initState();
  }

  /////////////////// Toast & ScaffoldText /////////////////

  void Toast(var message) async {
    await methodChannel.invokeMethod('getToast', {"message": message});
  }

/////////////////////////// DATABASE ////////////////////

  Future<void> _launchUrl_meskan() async {
    if (!await launchUrl(_url_meskan)) {
      throw Exception('Could not launch $_url_meskan');
    }
  }

  Future<void> _launchUrl_meftetahie() async {
    if (!await launchUrl(_url_meftetahie)) {
      throw Exception('Could not launch $_url_meftetahie');
    }
  }

  Future<void> _launchUrl_nmeftetahie() async {
    if (!await launchUrl(_url_nmeftetahie)) {
      throw Exception('Could not launch $_url_nmeftetahie');
    }
  }

  Future<void> _launchUrl_nazarsanji() async {
    if (!await launchUrl(_url_nazarsanji)) {
      throw Exception('Could not launch $_url_nazarsanji');
    }
  }

  Future<void> _launchUrl_arzyabi() async {
    if (!await launchUrl(_url_arzyabi)) {
      throw Exception('Could not launch $_url_arzyabi');
    }
  }

  Future<void> _launchUrl_film() async {
    if (!await launchUrl(_url_film)) {
      throw Exception('Could not launch $_url_film');
    }
  }

  Future<void> _launchUrl_gallery() async {
    if (!await launchUrl(_url_gallery)) {
      throw Exception('Could not launch $_url_gallery');
    }
  }

  Future<void> _launchUrl_instagram() async {
    if (!await launchUrl(_url_instagram)) {
      throw Exception('Could not launch $_url_instagram');
    }
  }

  Future<void> _launchUrl_farhangi() async {
    if (!await launchUrl(_url_farhangi)) {
      throw Exception('Could not launch $_url_farhangi');
    }
  }

  Future<void> _launchUrl_akhbar() async {
    if (!await launchUrl(_url_akhbar)) {
      throw Exception('Could not launch $_url_akhbar');
    }
  }

  Future<void> _launchUrl_khandani() async {
    if (!await launchUrl(_url_khandani)) {
      throw Exception('Could not launch $_url_khandani');
    }
  }

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
          
مسابقات ورزشی فرهنگیان کل کشور
مشهد مقدس - تابستان 1403     
""",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Iransans', fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          drawer: Drawer(
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Image(
                      image: AssetImage('assets/images/header.jpg'),
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.camera,
                      color: Colors.black54,
                    ),
                    title: Text("پیج اینستاگرام",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'Iransans', color: Colors.black87)),
                    onTap: () {
                      _launchUrl_instagram();
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.photo_album,
                      color: Colors.black54,
                    ),
                    title: Text("پوستر مسابقات",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'Iransans', color: Colors.black87)),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Poster();
                      }));
                    },
                  ),
                  // ListTile(
                  //     leading: const Icon(
                  //       Icons.control_point,
                  //       color: Colors.white70,
                  //     ),
                  //     title: Text("ارسال فایل برنامه",
                  //         textAlign: TextAlign.right,
                  //         style: TextStyle(
                  //             fontFamily: 'Iransans', color: Colors.black87)),
                  //     onTap: () {}),
                  ListTile(
                    leading: const Icon(
                      Icons.exit_to_app,
                      color: Colors.black54,
                    ),
                    title: Text("خروج",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'Iransans', color: Colors.black87)),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'از برنامه خارج می شوید؟',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 18),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      exit(0);
                                    },
                                    child: Text(
                                      'بله',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.black26, fontSize: 15),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'خیر',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.black26, fontSize: 15),
                                    ))
                              ],
                            );
                          });
                    },
                  ),
                ],
              )),
          body: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Page1();
                            }));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                border:
                                    Border.all(color: Colors.black38, width: 1),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/1.png',
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Text(
                                          '''آدرس مراسم افتتاحیه:
امام خمینی 25 ، باغ ملی ، تالار صبا''',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 18),
                                        )),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            _launchUrl_meftetahie();
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
                                            _launchUrl_nmeftetahie();
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/2.png',
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Page3();
                          }));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/3.png',
                                ),
                              ],
                            )),
                      )),
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Page4();
                            }));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/4.png',
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _launchUrl_farhangi();
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/5.png',
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          _launchUrl_akhbar();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/6.png',
                                ),
                              ],
                            )),
                      )),
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
                            _launchUrl_gallery();
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/7.png',
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _launchUrl_film();
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/8.png',
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          _launchUrl_khandani();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/9.png',
                                ),
                              ],
                            )),
                      )),
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
                            _launchUrl_nazarsanji();
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/10.png',
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _launchUrl_arzyabi();
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/11.png',
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      '''
تماس با ما از طریق ایتا 
۰۹۰۰۶۲۱۲۶۶۰

دفتر معاونت تربیت بدنی و سلامت اداره آموزش و پرورش خراسان رضوی 
۰۵۱۳۲۲۳۵۶۴۷''',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'تایید',
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/12.png',
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
