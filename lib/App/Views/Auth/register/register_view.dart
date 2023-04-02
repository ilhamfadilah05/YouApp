// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youapp_itv_test/App/Components/Colors/color.dart';
import 'package:youapp_itv_test/App/Controllers/Auth/register/register_controller.dart';
import 'package:youapp_itv_test/App/Views/Auth/login/login_view.dart';

import '../../../Components/Widget/Container/container.dart';
import '../../../Components/Widget/Container/container_button.dart';
import '../../../Components/Widget/Text/text_stye.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final conn = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.offAll(LoginView());
          return false;
        },
        child: Scaffold(body: containerGradient(context, body(context))));
  }

  Widget body(BuildContext context) {
    return Obx(() => ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.offAll(LoginView());
              },
              child: textDefault("< Back", Colors.white, 16, FontWeight.normal),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 20, left: 20),
              child: textDefault(
                  conn.tittle.value, Colors.white, 26, FontWeight.bold),
            ),
            formLogin(),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                conn.boolBtnRegister.value ? conn.apiRegister() : null;
              },
              child: conn.boolBtnRegister.value
                  ? buttonAuthActive(context, "Register")
                  : buttonAuthDeactive(context, "Register"),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textDefault(
                    "Have an account? ", Colors.white, 14, FontWeight.normal),
                InkWell(
                  onTap: () => Get.offAll(LoginView()),
                  child: Text(
                    "Login here",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: colorGold),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Column formLogin() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5)),
          child: TextFormField(
            controller: conn.email,
            style: TextStyle(
                fontFamily: 'poppins', fontSize: 14, color: Colors.white),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              conn.validasi(value);
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter email",
                hintStyle: TextStyle(
                    fontFamily: 'poppins',
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
          ),
        ),
        conn.emailNotValid.value
            ? Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      textDefault("Email not valid !", Colors.red, 14,
                          FontWeight.normal)
                    ],
                  ),
                ],
              )
            : Container(),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5)),
          child: TextFormField(
            controller: conn.username,
            style: TextStyle(
                fontFamily: 'poppins', fontSize: 14, color: Colors.white),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              conn.validasi(value);
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Create username",
                hintStyle: TextStyle(
                    fontFamily: 'poppins',
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5)),
            child: Obx(
              () => TextFormField(
                controller: conn.createPass,
                onChanged: (value) {
                  conn.validasi(value);
                },
                keyboardType: TextInputType.number,
                obscureText: conn.visiblePass1.value,
                style: TextStyle(
                    fontFamily: 'poppins', fontSize: 14, color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Create password ",
                    suffixIcon: conn.visiblePass1.value
                        ? InkWell(
                            onTap: () {
                              conn.tapVisiblePass1();
                            },
                            child: Icon(
                              Icons.visibility_off_outlined,
                              size: 22,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              conn.tapVisiblePass1();
                            },
                            child: Icon(
                              Icons.visibility_outlined,
                              size: 22,
                            ),
                          ),
                    suffixIconColor: Colors.grey,
                    hintStyle: TextStyle(
                        fontFamily: 'poppins',
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.normal)),
              ),
            )),
        SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5)),
            child: Obx(
              () => TextFormField(
                controller: conn.confirmPass,
                onChanged: (value) {
                  conn.validasi(value);
                },
                keyboardType: TextInputType.number,
                obscureText: conn.visiblePass2.value,
                style: TextStyle(
                    fontFamily: 'poppins', fontSize: 14, color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Confirm password ",
                    suffixIcon: conn.visiblePass2.value
                        ? InkWell(
                            onTap: () {
                              conn.tapVisiblePass2();
                            },
                            child: Icon(
                              Icons.visibility_off_outlined,
                              size: 22,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              conn.tapVisiblePass2();
                            },
                            child: Icon(
                              Icons.visibility_outlined,
                              size: 22,
                            ),
                          ),
                    suffixIconColor: Colors.grey,
                    hintStyle: TextStyle(
                        fontFamily: 'poppins',
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.normal)),
              ),
            )),
        conn.passwordNotSame.value
            ? Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      textDefault("passwords are not the same !", Colors.red,
                          14, FontWeight.normal)
                    ],
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}
