import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp_itv_test/App/Views/Profile/profile_view.dart';

class ProfileController extends GetxController {
  final usernameT = TextEditingController();
  final birtdayT = TextEditingController();
  final horoscopeT = TextEditingController();
  final zodiacT = TextEditingController();
  final heightT = TextEditingController();
  final weightT = TextEditingController();
  var base64Foto = "".obs;

  var email = "".obs;
  var gender = "Male".obs;
  var boolTapEdit = false.obs;
  var interest = [].obs;

  var genderList = ['Male', 'Female'].obs;

  void tapEditAbout() {
    boolTapEdit.value = true;
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    usernameT.text = prefs.getString("nameUser")!;
    email.value = prefs.getString("emailUser")!;
    base64Foto.value = prefs.getString("potoUser")!;
    birtdayT.text = prefs.getString("birthdayUser")!;
    gender.value = prefs.getString("genderUser")!;
    horoscopeT.text = prefs.getString("horoscopeUser")!;
    zodiacT.text = prefs.getString("zodiacUser")!;
    heightT.text = prefs.getString("heightUser")!;
    weightT.text = prefs.getString("weightUser")!;
    interest.value = jsonDecode(prefs.getString("interestUser")!);
    print(interest);
  }

  void onChangeGender(String value) {
    gender.value = value;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2016, 8, 10),
        firstDate: DateTime(1910),
        lastDate: DateTime(2017));
    if (picked != null) {
      birtdayT.text = DateFormat("dd MM yyyy").format(picked).toString();
    }
  }

  Future getfoto(BuildContext context) async {
    File? _image;
    dynamic bytes;
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    _image = File(imagePicked!.path);
    bytes = File(imagePicked.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    base64Foto.value = img64;
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nameUser', usernameT.text);
    prefs.setString('genderUser', gender.value);
    prefs.setString('birthdayUser', birtdayT.text);
    prefs.setString('horoscopeUser', horoscopeT.text);
    prefs.setString('zodiacUser', zodiacT.text);
    prefs.setString('heightUser', heightT.text);
    prefs.setString('weightUser', weightT.text);
    prefs.setString('potoUser', base64Foto.value);
    boolTapEdit.value = false;
    Get.offAll(ProfileView());
  }
}
