import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/pages/main/main_controller.dart';
import 'package:fluttertest/pages/profile/profile_controller.dart';
import 'package:fluttertest/pages/signin/sign_in_controller.dart';
import 'package:get/get.dart';
import 'constant/app_strings.dart';
import 'constant/app_theme.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  InitBinding().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // transparent status bar
      statusBarIconBrightness: Brightness.dark // dark text for status bar
      ));
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
      enableLog: true,
      title: AppStrings.appName,
      theme: appPrimaryTheme(),
      initialRoute: Routes.initial,
      initialBinding: InitBinding(),
      getPages: AppPages.routes,
    );
  }
}

class InitBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
   Get.lazyPut<MainController>(() => MainController(), fenix: true);
   Get.lazyPut<ProfileController>(() =>ProfileController() ,fenix:true);
      
  }
}
