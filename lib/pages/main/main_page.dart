import 'package:flutter/material.dart';
import 'package:fluttertest/constant/app_colors.dart';
import 'package:fluttertest/constant/app_strings.dart';
import 'package:fluttertest/pages/emptyview/empty_view_page.dart';
import 'package:fluttertest/pages/main/main_controller.dart';
import 'package:fluttertest/pages/profile/profile_page.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.currentIndex.value == 0) {
          return true;
        } else {
          setState(() => controller.currentIndex.value = 0);
          return false;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.currentIndex.value,
            children: [
              const EmpatyViewPage("Home"),
              const EmpatyViewPage("Search"),
              const EmpatyViewPage("Post"),
              const EmpatyViewPage("Quations"),
              const ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black26,
          selectedItemColor: buttonColor,
          onTap: (value) {
            // Respond to item press.
            setState(() => controller.currentIndex.value = value);
          },
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            _bottomNavigationBarItem(
              icon: Icons.home,
              label: AppStrings.home,
            ),
            _bottomNavigationBarItem(
              icon: Icons.search,
              label: AppStrings.search,
            ),
            _bottomNavigationBarItem(
              icon: Icons.add_box_rounded,
              label: AppStrings.post,
            ),
            _bottomNavigationBarItem(
              icon: Icons.send,
              label: AppStrings.queations,
            ),
            _bottomNavigationBarItem(
              icon: Icons.person,
              label: AppStrings.profile,
            )
          ],
        ),
      ),
    );
  }
}

_bottomNavigationBarItem({IconData? icon, String? label}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}
