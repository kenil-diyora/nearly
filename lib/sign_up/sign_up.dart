import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearly/config/user_auth.dart';
import 'package:nearly/sign_up/controller.dart';
import '../config/app_color.dart';
import '../widget/button.dart';
import '../widget/google_login.dart';
import '../widget/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final key = GlobalKey<FormState>();
  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorConst.green,
                    ),
                  ),
                ),
                textField(
                  controller: controller.email.value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter email ID";
                    }
                    return null;
                  },
                  title: "Email",
                  hintText: "Enter your email ID",
                ),
                textField(
                  controller: controller.password.value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    }
                    return null;
                  },
                  tMargin: 20,
                  title: "Password",
                  hintText: "Enter your password",
                ),
                button(
                  onTap: () async {
                    if (key.currentState!.validate()) {
                      signUpAuth(
                        context,
                        email: controller.email.value.text,
                        password: controller.password.value.text,
                      );
                    }

                  },
                  tMargin: 25,
                  title: "SIGN UP",
                ),
                googleLogin(
                  tMargin: 15,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorConst.subTitle,
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a user?  ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: ColorConst.subTitle,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorConst.title,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
