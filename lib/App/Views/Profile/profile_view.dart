// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youapp_itv_test/App/Components/Colors/color.dart';
import 'package:youapp_itv_test/App/Components/Widget/Text/text_stye.dart';
import 'package:youapp_itv_test/App/Controllers/Profile/profile_controller.dart';
import 'package:youapp_itv_test/App/Views/Auth/login/login_view.dart';
import 'package:youapp_itv_test/App/Views/Profile/interest_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final conn = Get.put(ProfileController());
  @override
  void initState() {
    conn.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() => Scaffold(
          backgroundColor: blackDoff,
          appBar: appBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                profileUser(size),
                SizedBox(
                  height: 5,
                ),
                conn.boolTapEdit.value
                    ? widEdit(size)
                    : (conn.birtdayT.text == "" &&
                            conn.horoscopeT.text == "" &&
                            conn.zodiacT.text == "" &&
                            conn.heightT.text == "" &&
                            conn.weightT.text == "")
                        ? widdNodata(size)
                        : widdData(size),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Color(0xFFF0E191F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault(
                              "Interest", Colors.white, 16, FontWeight.bold),
                          InkWell(
                            onTap: () => Get.offAll(InterestView()),
                            child: Icon(
                              Icons.edit_outlined,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      (conn.interest.length == 0)
                          ? textDefault(
                              "Add in your interest to find a better match",
                              Colors.white.withOpacity(0.5),
                              14,
                              FontWeight.normal)
                          : GridView.builder(
                              padding: EdgeInsets.only(bottom: 20),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: conn.interest.length,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, i) {
                                return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: textDefault(conn.interest[i],
                                          Colors.white, 14, FontWeight.normal),
                                    ));
                              })
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Container profileUser(Size size) {
    Uint8List image = base64Decode(conn.base64Foto.value);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: size.width / 2,
      decoration: BoxDecoration(
          color: Color(0xFFF162329), borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          image.isEmpty
              ? Container()
              : Container(
                  width: size.width,
                  // height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.memory(
                      image,
                      opacity: const AlwaysStoppedAnimation(.5),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textDefault(
                        conn.usernameT.text, Colors.white, 20, FontWeight.bold),
                    (conn.birtdayT.text == "")
                        ? Container()
                        : (conn.horoscopeT.text == "")
                            ? Container()
                            : (conn.zodiacT.text == "")
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textDefault(conn.gender.value,
                                          Colors.white, 18, FontWeight.normal),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              width: 150,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/horos.png',
                                                    width: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  textDefault(
                                                      conn.horoscopeT.text,
                                                      Colors.white,
                                                      14,
                                                      FontWeight.normal),
                                                ],
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              width: 150,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/zodiac.png',
                                                    width: 30,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  textDefault(
                                                      conn.zodiacT.text,
                                                      Colors.white,
                                                      14,
                                                      FontWeight.normal),
                                                ],
                                              )),
                                        ],
                                      )
                                    ],
                                  )
                  ],
                )),
          )
        ],
      ),
    );
  }

  Container widdNodata(Size size) {
    return Container(
      height: size.width / 3,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF0E191F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textDefault("About", Colors.white, 16, FontWeight.bold),
              InkWell(
                onTap: () => conn.tapEditAbout(),
                child: Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          textDefault("Add in your your to help others know you\nbetter",
              Colors.white.withOpacity(0.5), 14, FontWeight.normal)
        ],
      ),
    );
  }

  Container widdData(Size size) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF0E191F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textDefault("About", Colors.white, 16, FontWeight.bold),
              InkWell(
                onTap: () => conn.tapEditAbout(),
                child: Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              textDefault('Birthday: ', Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              textDefault(
                  conn.birtdayT.text, Colors.white, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              textDefault('Horoscope: ', Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              textDefault(
                  conn.horoscopeT.text, Colors.white, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              textDefault('Zodiac: ', Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              textDefault(
                  conn.zodiacT.text, Colors.white, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              textDefault('Height: ', Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              textDefault(conn.heightT.text + " cm", Colors.white, 14,
                  FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              textDefault('Weight: ', Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              textDefault(conn.weightT.text + " kg", Colors.white, 14,
                  FontWeight.normal),
            ],
          )
        ],
      ),
    );
  }

  Container widEdit(Size size) {
    Uint8List image = base64Decode(conn.base64Foto.value);
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF0E191F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textDefault("About", Colors.white, 16, FontWeight.bold),
              InkWell(
                onTap: () => conn.saveData(),
                child: textDefault(
                    "Save & Update", colorGold, 12, FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              image.isEmpty
                  ? InkWell(
                      onTap: () => conn.getfoto(context),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.add,
                          color: colorGold,
                          size: 30,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () => conn.getfoto(context),
                      child: Container(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                width: 10,
              ),
              textDefault("Add image", Colors.white, 14, FontWeight.normal)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textDefault("Display name:", Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              SizedBox(
                width: 30,
              ),
              Container(
                width: size.width / 2,
                padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  controller: conn.usernameT,
                  style: TextStyle(
                      fontFamily: 'poppins', fontSize: 14, color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    // conn.onChange(value);
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter name",
                      hintStyle: TextStyle(
                          fontFamily: 'poppins',
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textDefault("Gender:", Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              SizedBox(
                width: 30,
              ),
              Container(
                width: size.width / 2,
                padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButton(
                    alignment: Alignment.centerRight,
                    value: conn.gender.value,
                    dropdownColor: blackDoff,
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 14,
                        color: Colors.white),
                    items: conn.genderList.map((String items) {
                      return DropdownMenuItem(
                        child: Text(
                          items,
                        ),
                        value: items,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      conn.onChangeGender(newValue!);
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textDefault("Birthday:", Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              SizedBox(
                width: 30,
              ),
              InkWell(
                onTap: () => conn.selectDate(context),
                child: Container(
                  width: size.width / 2,
                  padding: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    enabled: false,
                    // onTap: () => conn.selectDate(context),
                    textAlign: TextAlign.right,
                    controller: conn.birtdayT,
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 14,
                        color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      // conn.onChange(value);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "DD MM YYYY",
                        hintStyle: TextStyle(
                            fontFamily: 'poppins',
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textDefault("Horoscope:", Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              SizedBox(
                width: 30,
              ),
              Container(
                  width: size.width / 2,
                  padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    conn.getZodiacSign(conn.selectTanggal.value),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 14,
                        color: Colors.white),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textDefault("Zodiac:", Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              SizedBox(
                width: 30,
              ),
              Container(
                width: size.width / 2,
                padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  controller: conn.zodiacT,
                  style: TextStyle(
                      fontFamily: 'poppins', fontSize: 14, color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    // conn.onChange(value);
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "---",
                      hintStyle: TextStyle(
                          fontFamily: 'poppins',
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textDefault("Height:", Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              SizedBox(
                width: 30,
              ),
              Container(
                width: size.width / 2,
                padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  controller: conn.heightT,
                  style: TextStyle(
                      fontFamily: 'poppins', fontSize: 14, color: Colors.white),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // conn.onChange(value);
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixText: ' cm',
                      suffixStyle:
                          TextStyle(fontFamily: 'poppins', color: Colors.white),
                      hintText: "Add height",
                      hintStyle: TextStyle(
                          fontFamily: 'poppins',
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textDefault("Weight:", Colors.white.withOpacity(0.5), 14,
                  FontWeight.normal),
              SizedBox(
                width: 30,
              ),
              Container(
                width: size.width / 2,
                padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  controller: conn.weightT,
                  style: TextStyle(
                      fontFamily: 'poppins', fontSize: 14, color: Colors.white),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // conn.onChange(value);
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixText: ' kg',
                      suffixStyle:
                          TextStyle(fontFamily: 'poppins', color: Colors.white),
                      hintText: "Add Weight",
                      hintStyle: TextStyle(
                          fontFamily: 'poppins',
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: blackDoff,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          onTap: () => Get.offAll(LoginView()),
          child: Row(
            children: [
              Icon(Icons.logout),
              textDefault(" Logout", Colors.white, 14, FontWeight.normal),
            ],
          ),
        ),
        textDefault(conn.usernameT.text, Colors.white, 14, FontWeight.normal),
        Container(
          width: 20,
        )
      ]),
    );
  }
}
