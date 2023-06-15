import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nearly/bottom_bar/bottom_bar.dart';
import 'package:nearly/widget/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../select_vehicle/select_vehicle.dart';
import 'loading_dialog.dart';

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
    setUserData(credential.user!.uid);
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
    setUserData(credential.user!.uid);
    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const BottomBar(),
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

void setUserData(String? uid) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(
    "uid",
    uid!,
  );
}

Future<void> googleSigUp(
  BuildContext context,
) async {
  showLoadingDialog(context);
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      // Getting users credential.
      UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(authCredential);
      User? user = result.user;
      if (user != null) {
        // googleLogin(account: user);
        debugPrint("${FirebaseAuth.instance.currentUser?.uid}");
        final userSnapshot = await FirebaseFirestore.instance
            .collection('user')
            .where(
              'uid',
              isEqualTo: FirebaseAuth.instance.currentUser?.uid,
            )
            .get();
        if (userSnapshot.docs.isEmpty) {
          FirebaseFirestore.instance.collection("user").add(
            {
              "uid": FirebaseAuth.instance.currentUser?.uid,
              "email": FirebaseAuth.instance.currentUser?.email,
              "phone": FirebaseAuth.instance.currentUser?.phoneNumber,
              "photo": FirebaseAuth.instance.currentUser?.photoURL,
            },
          );
          if (context.mounted) {
            hideLoadingDialog(context);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const SelectVehicle(
                    // uid: FirebaseAuth.instance.currentUser?.uid,
                    ),
              ),
              (route) => false,
            );
          }
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(
            "uid",
            "${FirebaseAuth.instance.currentUser?.uid}",
          );
        } else {
          if (context.mounted) {
            hideLoadingDialog(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BottomBar(
                    // uid: FirebaseAuth.instance.currentUser?.uid,
                    ),
              ),
            );
          }
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(
            "uid",
            "${FirebaseAuth.instance.currentUser?.uid}",
          );
        }
      }
    } else {
      if (context.mounted) {
        hideLoadingDialog(context);
      }
    }
  } catch (e) {
    hideLoadingDialog(context);
    // debugPrint('error = $e');
  }
}
