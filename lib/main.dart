import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nearly/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) => debugPrint(
      "firebase initialize successfully",
    ),
  );
  runApp(
    const MaterialApp(
      title: "Nearly",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
