// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertest/constant/app_colors.dart';
import 'package:fluttertest/constant/app_strings.dart';
import 'package:fluttertest/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // text for header
                    Center(
                      child: Text(
                        AppStrings.joinToday,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // add space between button and text
                    SizedBox(height: 40),
                    // signup with google button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: Icon(MdiIcons.google),
                        ),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: const Text(
                            AppStrings.continueWithGoogle,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15.0),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(primary: buttonColor),
                      ),
                    ),
                    // add space
                    SizedBox(height: 20),
                    // sign up with email
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // redirect to next screen
                          Get.toNamed(Routes.signin);
                        },
                        child: const Text(
                          AppStrings.signInWithEmail,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15.0),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
