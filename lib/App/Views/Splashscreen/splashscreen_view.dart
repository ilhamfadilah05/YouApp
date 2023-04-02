// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youapp_itv_test/App/Components/Widget/Container/container.dart';
import 'package:youapp_itv_test/App/Controllers/Splashscreen/splashscreen_controller.dart';

import '../../Components/Widget/Text/text_stye.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({super.key});

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  final conn = Get.put(SplashscreenController());
  @override
  void initState() {
    conn.cekLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: containerGradient(context, body()));
  }

  Widget body() {
    return Center(
      child: textDefault("YouApp", Colors.white, 30, FontWeight.bold),
    );
  }
}
