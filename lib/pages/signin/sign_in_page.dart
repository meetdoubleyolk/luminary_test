import 'package:flutter/material.dart';
import 'package:fluttertest/constant/app_strings.dart';
import 'package:fluttertest/pages/signin/sign_in_controller.dart';
import 'package:fluttertest/routes/app_routes.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  SignInController controller = Get.find();
   
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 48.0, horizontal: 18),
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                //
                                Text(
                                  "Welcome!",
                                  style: TextStyle(
                                      fontSize: Get.width * 0.05,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Sign in to Continue",
                                    style: TextStyle(
                                        fontSize: Get.width * 0.03,
                                        color: Colors.black)),

                                SizedBox(
                                  height: Get.width * 0.05,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      child: Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: controller.loginEmailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                errorText: controller.loginEmailError.value,
                                hintText: AppStrings.pleaseEnterEmail,
                              ),
                            ),
                            TextField(
                              controller: controller.loginPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                errorText:
                                    controller.loginPasswordError.value,
                                hintText: AppStrings.pleaseEnterPassword,
                              ),
                            ),
                            SizedBox(
                              height: Get.width * 0.05,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  //validate login
                                  controller.validateLogin();
                                   //TODO add when get success resposne    
                                  
                                  
                                },
                                child: const Text(
                                  AppStrings.signIn,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(() => controller.isTaskInProgress.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container())
        ],
      ),
    );
  }
}
