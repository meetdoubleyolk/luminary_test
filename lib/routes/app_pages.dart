import 'package:fluttertest/pages/emptyview/empty_view_page.dart';
import 'package:fluttertest/pages/main/main_page.dart';
import 'package:fluttertest/pages/setting/settings_page.dart';
import 'package:fluttertest/pages/signin/sign_in_page.dart';
import 'package:fluttertest/pages/signup/signup_page.dart';

import 'app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = Routes.initial;
  static final routes = [
    GetPage(name: Routes.initial, page: () => const SignUpPage()),
    GetPage(name: Routes.signin, page: () => const SignInPage()),
    GetPage(name: Routes.main, page: () => const MainPage()),
    GetPage(name: Routes.empty, page: () => const EmpatyViewPage("Home")),
    GetPage(name: Routes.profileSetting, page: () => const SettingsPage())
  ];
}
