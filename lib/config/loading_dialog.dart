import 'package:flutter/material.dart';
import 'package:nearly/config/app_color.dart';

void showLoadingDialog(
  BuildContext context,
) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(
          color: ColorConst.green,
        ),
      );
    },
  );
}

void hideLoadingDialog(
  BuildContext context,
) {
  Navigator.pop(context);
}
