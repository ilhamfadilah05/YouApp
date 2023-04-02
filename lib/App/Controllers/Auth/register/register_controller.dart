import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp_itv_test/App/Views/Profile/profile_view.dart';

class RegisterController extends GetxController {
  var tittle = "Register".obs;
  final email = TextEditingController();
  final username = TextEditingController();

  final createPass = TextEditingController();
  final confirmPass = TextEditingController();

  var visiblePass1 = true.obs;
  var visiblePass2 = true.obs;
  var emailNotValid = false.obs;
  var passwordNotSame = false.obs;

  var boolBtnRegister = false.obs;

  void tapVisiblePass1() {
    visiblePass1.value = !visiblePass1.value;
  }

  void tapVisiblePass2() {
    visiblePass2.value = !visiblePass2.value;
  }

  void validasi(String value) {
    if (email.text == "") {
      boolBtnRegister.value = false;
      emailNotValid.value = false;
      passwordNotSame.value = false;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(email.text)) {
      boolBtnRegister.value = false;
      emailNotValid.value = true;
      passwordNotSame.value = false;
    } else if (username.text == "") {
      boolBtnRegister.value = false;
      emailNotValid.value = false;
      passwordNotSame.value = false;
    } else if (createPass.text == "") {
      boolBtnRegister.value = false;
      emailNotValid.value = false;
      passwordNotSame.value = false;
    } else if (confirmPass.text == "") {
      boolBtnRegister.value = false;
      emailNotValid.value = false;
      passwordNotSame.value = false;
    } else if (confirmPass.text != createPass.text) {
      boolBtnRegister.value = false;
      emailNotValid.value = false;
      passwordNotSame.value = true;
    } else {
      boolBtnRegister.value = true;
      emailNotValid.value = false;
      passwordNotSame.value = false;
    }
  }

  // ########## API ########### //

  apiRegister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('emailUser', email.text);
    prefs.setString('nameUser', username.text);
    prefs.setString('passUser', confirmPass.text);
    prefs.setString('token_login', email.text);

    Get.offAll(const ProfileView());
    // Map data = {
    //   'name': "${username.text}",
    //   'email': "${email.text}",
    //   'password': "${confirmPass}",
    // };

    // dynamic jsonResponse;
    // var response = await http
    //     .post(Uri.parse('http://techtest.youapp.ai/api/register'), body: data);

    // if (response.statusCode == 200) {

    // } else {
    //   print("status : ${response.statusCode}");
    // }
  }
}
