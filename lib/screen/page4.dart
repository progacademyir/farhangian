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
import 'package:platformchannels/screen/Page4.dart';
import 'package:platformchannels/screen/util.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _HomeState();
}

class _HomeState extends State<Page4> {
  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.io/toast');

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Uri _url_f_moqnie = Uri.parse(
      'https://www.google.com/maps/place/Razavi+Khorasan+Province,+Mashhad،+خیابان+کوشش+31,+Kalantary+Expy,+Shahid+Jihaad+moghniye+sport+complex,+Iran/@36.2569399,59.5976222,16z/data=!4m6!3m5!1s0x3f6c96c4bc5cf261:0x98096191309240a1!8m2!3d36.2569399!4d59.5976222!16s/g/11ckvvh11g'); // شهید مغنیه

  final Uri _url_f_behesht = Uri.parse(
      'https://www.google.com/maps/place/سالن+ورزشی+بهشت،+7MV2+9HJ,+Mashhad,+Razavi+Khorasan+Province,+Iran/@36.2934625,59.6513906,16z/data=!4m6!3m5!1s0x3f6c9109950ba997:0x3a1daadaaa3f487c!8m2!3d36.2934625!4d59.6513906!16s/g/11sk6fk_9b'); // سالن بهشت

  final Uri _url_f_samen = Uri.parse(
      'https://www.google.com/maps/place/Samen+Sports+Stadium,+7JHG+XJ7+Jalaliyeh,+Mashhad,+Razavi+Khorasan+Province,+Iran/@36.2799107,59.6265548,16z/data=!4m6!3m5!1s0x3f6c90ccbbfdae6d:0x39a3a840176627f7!8m2!3d36.2799107!4d59.6265548!16s/g/11g65gd1b2'); // سالن ثامن

  final Uri _url_v_akhondkh = Uri.parse(
      'https://www.google.com/maps/place/Khorasan,+Mashhad,+Akhound+Khorasani,+7HJX+HCP+سالن+ورزشی+مهران,+Iran/@36.2814665,59.5985838,16z/data=!4m6!3m5!1s0x3f6c913aac501691:0x8fa9386ed7750cdc!8m2!3d36.2814665!4d59.5985838!16s/g/1tg853n8'); // سالن آخوند خراسانی

  final Uri _url_v_moalem = Uri.parse(
      'https://www.google.com/maps/place/مجتمع+ورزشی+معلم،+7HHG+9W5,+Mashhad,+Razavi+Khorasan+Province,+Iran/@36.2783869,59.5773615,16z/data=!4m6!3m5!1s0x3f6c913ad8bfb5ad:0xba9605f1117afc12!8m2!3d36.2783869!4d59.5773615!16s/g/11vdn7dq55'); // سالن معلم

  final Uri _url_t_ferdosi = Uri.parse(
      'https://www.google.com/maps/place/Razavi+Khorasan+Province,+Mashhad,+رانندگان،+7JJ4+8Q3+Ferdowsi+Sports+Club,+Iran/@36.2807568,59.606913,16z/data=!4m6!3m5!1s0x3f6c912902ffffff:0xdd1d39f02cf4a532!8m2!3d36.2807568!4d59.606913!16s/g/11txv1_53y'); // سالن فردوسی

  final Uri _url_nf_moqnie =
      Uri.parse('https://nshn.ir/aarb15fRWJjxYx'); // شهید مغنیه

  final Uri _url_nf_behesht =
      Uri.parse('https://nshn.ir/d2rb1j6n2JJjJg'); // سالن بهشت

  final Uri _url_nf_samen =
      Uri.parse('https://nshn.ir/73rb1Fq50JdVkN'); // سالن ثامن

  final Uri _url_nv_akhondkh =
      Uri.parse('https://nshn.ir/2brb1GhO0JjjcZ'); // سالن آخوند خراسانی

  final Uri _url_nv_moalem =
      Uri.parse('https://nshn.ir/56rb1FpR0JGptg'); // سالن معلم

  final Uri _url_nt_ferdosi =
      Uri.parse('https://nshn.ir/sb1FIxpJjn-U'); // سالن فردوسی

  final Uri _url_v_motahari = Uri.parse(
      'https://www.google.com/maps/place/سالن+ورزشی+شهید+مطهری،+8J27+3WX,+Mashhad,+Razavi+Khorasan+Province,+Iran‭/@36.3002257,59.6148714,17z/data=!4m6!3m5!1s0x3f6c9129166a9fa9:0xf0581a7727831705!8m2!3d36.3002257!4d59.6148714!16s/g/11qbfqkvn9'); // سالن مطهری

  final Uri _url_nv_motahari =
      Uri.parse('https://nshn.ir/88rb1Jbj_JdhiA'); // سالن مطهری

  @override
  void initState() {
    super.initState();
  }

  Future<void> _launchUrl_f_moqnie() async {
    if (!await launchUrl(_url_f_moqnie)) {
      throw Exception('$_url_f_moqnie باز نمی شود!');
    }
  }

  Future<void> _launchUrl_f_behesht() async {
    if (!await launchUrl(_url_f_behesht)) {
      throw Exception('$_url_f_behesht باز نمی شود!');
    }
  }

  Future<void> _launchUrl_f_samen() async {
    if (!await launchUrl(_url_f_samen)) {
      throw Exception('$_url_f_samen باز نمی شود!');
    }
  }

  Future<void> _launchUrl_v_akhondkh() async {
    if (!await launchUrl(_url_v_akhondkh)) {
      throw Exception('$_url_v_akhondkh باز نمی شود!');
    }
  }

  Future<void> _launchUrl_v_moalem() async {
    if (!await launchUrl(_url_v_moalem)) {
      throw Exception('$_url_v_moalem باز نمی شود!');
    }
  }

  Future<void> _launchUrl_t_ferdosi() async {
    if (!await launchUrl(_url_t_ferdosi)) {
      throw Exception('$_url_t_ferdosi باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nf_moqnie() async {
    if (!await launchUrl(_url_nf_moqnie)) {
      throw Exception('$_url_nf_moqnie باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nf_behesht() async {
    if (!await launchUrl(_url_nf_behesht)) {
      throw Exception('$_url_nf_behesht باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nf_samen() async {
    if (!await launchUrl(_url_nf_samen)) {
      throw Exception('$_url_nf_samen باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nv_akhondkh() async {
    if (!await launchUrl(_url_nv_akhondkh)) {
      throw Exception('$_url_nv_akhondkh باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nv_moalem() async {
    if (!await launchUrl(_url_nv_moalem)) {
      throw Exception('$_url_nv_moalem باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nt_ferdosi() async {
    if (!await launchUrl(_url_nt_ferdosi)) {
      throw Exception('$_url_nt_ferdosi باز نمی شود!');
    }
  }

  Future<void> _launchUrl_v_motahari() async {
    if (!await launchUrl(_url_v_motahari)) {
      throw Exception('$_url_v_motahari باز نمی شود!');
    }
  }

  Future<void> _launchUrl_nv_motahari() async {
    if (!await launchUrl(_url_nv_motahari)) {
      throw Exception('$_url_nv_motahari باز نمی شود!');
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
          
محل مسابقات
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
                                            'فوتسال: سالن ورزشی شهید جهاد مغنیه ، کوشش 29 ',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_f_moqnie();
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
                                                  _launchUrl_nf_moqnie();
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
                                            "فوتسال: سالن شهید جهاد مغنیه",
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
                                            'فوتسال: سالن بهشت شهرداری ، خیابان نبوت ، نبوت 44',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_f_behesht();
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
                                                  _launchUrl_nf_behesht();
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
                                            "فوتسال: سالن بهشت",
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
                                            'فوتسال: سالن ثامن الائمه ، پنج راه ، میدان عدالت',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_f_samen();
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
                                                  _launchUrl_nf_samen();
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
                                            "فوتسال: سالن ثامن الائمه",
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
                                            'والیبال: سالن ورزشی مهران ، آخوند خراسانی',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_v_akhondkh();
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
                                                  _launchUrl_nv_akhondkh();
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
                                            "والیبال: سالن ورزشی مهران",
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
                                            'والیبال: مجتمع ورزشی معلم، بلوار شهید نامجو ، بین نامجو 1 و 2/1',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_v_moalem();
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
                                                  _launchUrl_nv_moalem();
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
                                            "والیبال: سالن ورزشی معلم",
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
                                            'والیبال: سالن شهید مطهری ، چهار راه خواجه ربیع  تقاطع هاشمی نژاد و کاشانی ، کاشانی 22',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_v_motahari();
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
                                                  _launchUrl_nv_motahari();
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
                                            "والیبال: سالن شهید مطهری",
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
                                            'تنیس روی میز: سالن ورزشی فردوسی ، دانش غربی',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _launchUrl_t_ferdosi();
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
                                                  _launchUrl_nt_ferdosi();
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
                                            "تنیس روی میز: سالن ورزشی فردوسی",
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
