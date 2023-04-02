// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:youapp_itv_test/App/Components/Colors/color.dart';
import 'package:youapp_itv_test/App/Components/Widget/Text/text_stye.dart';

Widget buttonAuthActive(BuildContext context, String nameButton) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: buttonGradient),
        borderRadius: BorderRadius.circular(5)),
    child: Center(
      child: textDefault(nameButton, Colors.white, 16, FontWeight.normal),
    ),
  );
}

Widget buttonAuthDeactive(BuildContext context, String nameButton) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        gradient: LinearGradient(colors: buttonGradient),
        borderRadius: BorderRadius.circular(5)),
    child: Center(
      child: textDefault(nameButton, Colors.grey, 16, FontWeight.normal),
    ),
  );
}
