import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/pages/profile/profile_controller.dart';
import 'package:fluttertest/widget/profile_padding.dart';
import 'package:get/get.dart';
import 'list_view_settings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
              onPressed: () => Get.back())),
      body: Obx(
        () => SafeArea(
          child: SizedBox(
            height: Get.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // user image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.cover,
                            imageUrl: controller.appUser.value.photoUrl,
                            errorWidget: (context, url, error) => Image.asset(
                                  'assets/images/ic_profile_place_holder.png',
                                )),
                      ),

                      // user name
                      const SizedBox(
                        width: 12,
                      ),

                      Text(controller.appUser.value.name,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                const ListViewSettings(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
