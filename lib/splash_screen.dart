import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nearly/config/app_color.dart';
import 'package:nearly/home/home_screen.dart';
import 'package:nearly/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  set() {
    Timer(
      const Duration(seconds: 3),
      () {
        // print("=======================             ${pref.getString("uid")}");
        // SharedPreferences.setMockInitialValues({});
        if (context.mounted) {}
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    set();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Nearly",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w900,
            color: ColorConst.green,
          ),
        ),
      ),
    );
  }
}
