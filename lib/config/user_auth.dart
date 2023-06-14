import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nearly/bottom_bar/bottom_bar.dart';
import 'package:nearly/widget/toast.dart';

import '../select_vehicle/select_vehicle.dart';

void signUpAuth(
  BuildContext context, {
  String email = "",
  String password = "",
}) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseFirestore.instance.collection("user").add(
      {
        "uid": credential.user!.uid,
        "email": email,
        "password": password,
      },
    );
    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SelectVehicle(),
        ),
        (route) => false,
      );
    }
    toast(
      msg: "Sign up successfully.",
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      toast(
        msg: "The password provided is too weak.",
      );
    } else if (e.code == 'email-already-in-use') {
      toast(
        msg: "The account already exists for that email.",
      );
    }
  } catch (e) {
    toast(
      msg: "$e",
    );
  }
}

void loginAuth(
  BuildContext context, {
  String email = "",
  String password = "",
}) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => BottomBar(),
        ),
        (route) => false,
      );
    }
    toast(
      msg: "Login successfully.",
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      toast(
        msg: "No user found for that email.",
      );
    } else if (e.code == 'wrong-password') {
      toast(
        msg: "Wrong password provided for that user.",
      );
    }
  }
}
