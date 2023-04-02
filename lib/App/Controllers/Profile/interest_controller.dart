// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp_itv_test/App/Views/Profile/profile_view.dart';

class InterestController extends GetxController {
  var strsave = "Save".obs;
  var interestList = [
    'Music',
    'Basketball',
    'Fitness',
    'Gymming',
    'Football',
    'Swimming',
    'Food',
    'Animal',
    'Fashion',
    'Running',
    'Coding'
  ].obs;

  var addInterestList = [].obs;

  void tapInterest(String value) {
    if (addInterestList.value.contains(value)) {
    } else {
      addInterestList.add(value);
    }
  }

  void tapDeleteAddInterest(String e) {
    addInterestList.remove(e);
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodeInterest = jsonEncode(addInterestList);
    prefs.setString('interestUser', encodeInterest);
    Get.offAll(ProfileView());
  }
}
