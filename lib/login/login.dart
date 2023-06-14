import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearly/config/app_color.dart';
import 'package:nearly/config/user_auth.dart';
import 'package:nearly/login/controller.dart';
import 'package:nearly/sign_up/sign_up.dart';
import 'package:nearly/widget/button.dart';
import 'package:nearly/widget/google_login.dart';
import 'package:nearly/widget/text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final key = GlobalKey<FormState>();
  LoginController controller = Get.put(LoginController());

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
                    "Login",
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
                  onTap: () {
                    if (key.currentState!.validate()) {
                      loginAuth(
                        context,
                        email: controller.email.value.text,
                        password: controller.password.value.text,
                      );
                    }
                  },
                  tMargin: 25,
                  title: "login",
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
                      "New user?  ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: ColorConst.subTitle,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: const Text(
                        "SIGN UP",
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
