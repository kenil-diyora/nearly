import 'package:flutter/material.dart';
import 'package:nearly/login/login.dart';
import 'package:nearly/splash_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "Nearly",
      debugShowCheckedModeBanner: false,
      home: Login(),
    ),
  );
}
