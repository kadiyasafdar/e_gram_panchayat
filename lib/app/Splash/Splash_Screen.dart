import 'dart:async';

import 'package:e_gram_panchayat/app/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  goDefaultPage() {
    Timer(Duration(seconds: 2), () {
      Get.toNamed(AppRouter.home);
    });
  }

  // Init state

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    goDefaultPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset('assets/images/Group 1000001487.png'),
      ),
    );
  }
}
