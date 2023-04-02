// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youapp_itv_test/App/Components/Colors/color.dart';
import 'package:youapp_itv_test/App/Components/Widget/Container/container.dart';
import 'package:youapp_itv_test/App/Components/Widget/Container/container_button.dart';
import 'package:youapp_itv_test/App/Components/Widget/Text/text_stye.dart';
import 'package:youapp_itv_test/App/Controllers/Auth/login/login_controller.dart';
import 'package:youapp_itv_test/App/Views/Auth/register/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final conn = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: containerGradient(context, body()));
  }

  Widget body() {
    return Obx(() => ListView(
          children: [
            SizedBox(
              height: 50,
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
            conn.boolBtnLogin.value
                ? InkWell(
                    onTap: () => conn.apiLogin(),
                    child: buttonAuthActive(context, "Login"))
                : buttonAuthDeactive(context, "Login"),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textDefault(
                    "No account? ", Colors.white, 14, FontWeight.normal),
                InkWell(
                  onTap: () => Get.offAll(RegisterView()),
                  child: Text(
                    "Register here",
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
            controller: conn.username,
            style: TextStyle(
                fontFamily: 'poppins', fontSize: 14, color: Colors.white),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              conn.onChange(value);
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter username",
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
                controller: conn.password,
                onChanged: (value) {
                  conn.onChange(value);
                },
                keyboardType: TextInputType.number,
                obscureText: conn.visiblePass.value,
                style: TextStyle(
                    fontFamily: 'poppins', fontSize: 14, color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter password ",
                    suffixIcon: conn.visiblePass.value
                        ? InkWell(
                            onTap: () {
                              conn.tapVisiblePass();
                            },
                            child: Icon(
                              Icons.visibility_off_outlined,
                              size: 22,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              conn.tapVisiblePass();
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
      ],
    );
  }
}
