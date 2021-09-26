import 'package:flutter/material.dart';
import 'package:fluttertest/constant/app_strings.dart';
import 'package:fluttertest/pages/services/firebase_auth_service.dart';
import 'package:fluttertest/routes/app_routes.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var loginEmailError = "".obs;
  var loginPasswordError = "".obs;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  var isTaskInProgress = false.obs;

  void validateLogin() {
    final email = loginEmailController.text;
    final password = loginPasswordController.text;
    // validate check is valid or not
    if (GetUtils.isNullOrBlank(email) == true) {
      loginEmailError.value = AppStrings.pleaseEnterEmail;
    } else if (GetUtils.isEmail(email) == false) {
      loginEmailError.value = AppStrings.pleaseEnterValidEmail;
    } else {
      loginEmailError.value = "";
    }

    if (GetUtils.isNullOrBlank(password) == true) {
      loginPasswordError.value = AppStrings.pleaseEnterPassword;
    } else if (GetUtils.isLengthGreaterOrEqual(password, 6) == false) {
      loginPasswordError.value = AppStrings.pleasePasswordLength;
    } else {
      loginPasswordError.value = "";
    }

    if (loginEmailError.isEmpty && loginPasswordError.isEmpty) {
      loginWith(email, password);
    }
  }

  // login on auth first than get from table
  void loginWith(String email, String password) async {
    isTaskInProgress.value = true;
    final service = FirebaseAppAuthService();
    try {
      final uuid = await service.signIn(email, password);    
      Get.offAllNamed(Routes.main);
    } catch (ex) {
      Get.snackbar("error", "log in failed");
    } finally {
      isTaskInProgress.value = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
}
