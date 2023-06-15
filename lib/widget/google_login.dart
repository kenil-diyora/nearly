import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearly/config/user_auth.dart';

Widget googleLogin(
  BuildContext context, {
  double tMargin = 0,
  double lMargin = 0,
  double rMargin = 0,
  double bMargin = 0,
  double tPadding = 5,
  double lPadding = 5,
  double rPadding = 5,
  double bPadding = 5,
}) {
  return GestureDetector(
    onTap: () {
      googleSigUp(context);
    },
    child: Container(
      margin: EdgeInsets.only(
        top: tMargin,
        left: lMargin,
        right: rMargin,
        bottom: bMargin,
      ),
      padding: EdgeInsets.only(
        top: tPadding,
        left: lPadding,
        right: rPadding,
        bottom: bPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF4285F4),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://ubs.iilm.edu/wp-content/uploads/2016/03/Google-logo.png",
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
          const Expanded(
            child: Text(
              "  Continue with google",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.white,
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            color: Colors.transparent,
          ),
        ],
      ),
    ),
  );
}
