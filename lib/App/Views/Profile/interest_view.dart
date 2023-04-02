// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youapp_itv_test/App/Components/Colors/color.dart';
import 'package:youapp_itv_test/App/Components/Widget/Container/container.dart';
import 'package:youapp_itv_test/App/Components/Widget/Text/text_stye.dart';
import 'package:youapp_itv_test/App/Controllers/Profile/interest_controller.dart';
import 'package:youapp_itv_test/App/Views/Profile/profile_view.dart';

class InterestView extends StatefulWidget {
  const InterestView({super.key});

  @override
  State<InterestView> createState() => _InterestViewState();
}

class _InterestViewState extends State<InterestView> {
  final conn = Get.put(InterestController());

  @override
  void initState() {
    conn.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.offAll(ProfileView());
          return false;
        },
        child: Scaffold(body: containerGradient(context, body())));
  }

  Widget body() {
    return Obx(() => ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.offAll(ProfileView()),
                  child: textDefault(
                      "< Back", Colors.white, 14, FontWeight.normal),
                ),
                InkWell(
                  onTap: () => conn.saveData(),
                  child: textDefault(
                      conn.strsave.value, Colors.blue, 14, FontWeight.normal),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            textDefault("Tell everyone about yourself", colorGold, 14,
                FontWeight.normal),
            textDefault(
                "What interest you?", Colors.white, 24, FontWeight.normal),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...conn.addInterestList.map((e) => Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                textDefault(
                                    e, Colors.white, 14, FontWeight.normal),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () => conn.tapDeleteAddInterest(e),
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            ...conn.interestList.map((e) => InkWell(
                  onTap: () => conn.tapInterest(e),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.2)),
                    child: Column(
                      children: [
                        textDefault(e, Colors.white, 14, FontWeight.normal),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
