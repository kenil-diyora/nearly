import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nearly/config/app_color.dart';
import 'package:nearly/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Icon(
                Icons.person,
                size: 100,
                color: ColorConst.green,
              ),
            ),
            GestureDetector(
              onTap: () async {
                final GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.signOut();
                final SharedPreferences pref =
                    await SharedPreferences.getInstance();
                pref.clear();
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                      (route) => false);
                }
              },
              child: Container(
                margin: const EdgeInsets.only(
                  top: 50,
                  left: 15,
                  right: 15,
                  bottom: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConst.green,
                ),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorConst.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
