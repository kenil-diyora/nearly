import 'package:flutter/material.dart';

Widget textField({
  String title = "",
  String? hintText,
  TextEditingController? controller,
  String? Function(String?)? validator,
  void Function(String)? onChanged,
  double tMargin = 0,
  double lMargin = 0,
  double rMargin = 0,
  double bMargin = 0,
}) {
  return Padding(
    padding: EdgeInsets.only(
      top: tMargin,
      left: lMargin,
      right: rMargin,
      bottom: bMargin,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        TextFormField(
          onChanged: onChanged,
          controller: controller,
          validator: validator,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            )),
          ),
        ),
      ],
    ),
  );
}
