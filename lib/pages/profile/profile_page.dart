import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertest/constant/app_strings.dart';
import 'package:fluttertest/pages/profile/profile_controller.dart';
import 'package:fluttertest/routes/app_routes.dart';
import 'package:fluttertest/widget/profile_image_update.dart';
import 'package:fluttertest/widget/profile_padding.dart';
import 'package:fluttertest/widget/profile_sub_detail_row.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.getUser();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Center(
                  child: Text(
                controller.appUser.value.name,
                style: TextStyle(color: Colors.black),
              )),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Get.toNamed(Routes.profileSetting);
                },
                iconSize: 30,
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // profile pic
                // user image
                const ProfilePadding(),
                Container(
                    width: 130,
                    height: 130,
                    alignment: Alignment.center,
                    child: const ProfileImageUpdate()),
                const ProfilePadding(),
                // buttonof edit profile
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.25),
                  child: TextButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {},
                      child: const Text(
                        AppStrings.editProfile,
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const ProfilePadding(),
                // about us test field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.10),
                  child: Text(
                    controller.appUser.value.shortDescription,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                const ProfilePadding(),
                const ProfilePadding(),
                //email and date of birth

                ProfileSubDetailRow(
                  AppStrings.email,
                  controller.appUser.value.email,
                  AppStrings.dob,
                  DateFormat('dd/MM/yyyy').format(controller.appUser.value.dob!.toDate()),
                  firstIcon: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  seconIcon: const Icon(
                    Icons.date_range,
                    color: Colors.grey,
                  ),
                ),
                const ProfilePadding(),
                //from and languages

                ProfileSubDetailRow(
                  AppStrings.from,
                  controller.appUser.value.country,
                  AppStrings.languages,
                  controller.appUser.value.languages!.join(", "),
                  firstIcon: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                  ),
                  seconIcon: const Icon(
                    Icons.language,
                    color: Colors.grey,
                  ),
                ),
                const ProfilePadding(),

                // education and member since

                ProfileSubDetailRow(
                  AppStrings.education,
                  controller.appUser.value.education +
                      ", " +
                      controller.appUser.value.university,
                  AppStrings.memeberSince,
                   DateFormat('dd/MM/yyyy').format(controller.appUser.value.createdAt!.toDate()),
                  firstIcon: const Icon(
                    Icons.cast_for_education_outlined,
                    color: Colors.grey,
                  ),
                  seconIcon: const Icon(
                    Icons.supervised_user_circle,
                    color: Colors.grey,
                  ),
                ),
                const ProfilePadding(),
                const ProfilePadding(),

                //full bio
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    AppStrings.fullBio,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8.0),
                // about us test field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    controller.appUser.value.shortBio,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                // text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
