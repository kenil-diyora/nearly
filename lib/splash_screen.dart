import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nearly/bottom_bar/bottom_bar.dart';
import 'package:nearly/config/app_color.dart';
import 'package:nearly/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  set() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    Timer(
      const Duration(seconds: 3),
      () {
        // print("=======================             ${pref.getString("uid")}");
        // SharedPreferences.setMockInitialValues({});
        // if (context.mounted) {}
        pref.getString("uid") == null
            ? Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
                (route) => false,
              )
            : Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomBar(),
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
