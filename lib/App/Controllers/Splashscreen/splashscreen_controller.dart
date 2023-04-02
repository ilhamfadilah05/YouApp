import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp_itv_test/App/Views/Profile/profile_view.dart';

import '../../Views/Auth/login/login_view.dart';

class SplashscreenController extends GetxController {
  void cekLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('token_login');
    if (stringValue == null) {
      Timer(const Duration(seconds: 1), () => Get.offAll(const LoginView()));
    } else {
      Timer(const Duration(seconds: 1), () => Get.offAll(ProfileView()));
    }
  }
}
