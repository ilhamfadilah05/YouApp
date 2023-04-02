import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Views/Profile/profile_view.dart';

class LoginController extends GetxController {
  var tittle = "Login".obs;
  final username = TextEditingController();
  final password = TextEditingController();
  var visiblePass = true.obs;
  var boolBtnLogin = false.obs;

  void tapVisiblePass() {
    visiblePass.value = !visiblePass.value;
  }

  void onChange(String value) {
    if (username.text == "") {
      boolBtnLogin.value = false;
    } else if (password.text == "") {
      boolBtnLogin.value = false;
    } else {
      boolBtnLogin.value = true;
    }
  }

  void apiLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nameUser', username.text);
    prefs.setString('passUser', password.text);
    prefs.setString('token_login', username.text);

    Get.offAll(const ProfileView());
  }
}
