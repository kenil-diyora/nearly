import 'package:flutter/cupertino.dart';
import 'package:nearly/config/app_color.dart';

Widget button({
  String title = "",
  double tMargin = 0,
  double lMargin = 0,
  double rMargin = 0,
  double bMargin = 0,
  Color? btnColor,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      margin: EdgeInsets.only(
        top: tMargin,
        left: lMargin,
        right: rMargin,
        bottom: bMargin,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: btnColor ?? ColorConst.green,
      ),
      alignment: Alignment.center,
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: ColorConst.white,
        ),
      ),
    ),
  );
}
