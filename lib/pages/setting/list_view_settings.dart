import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertest/pages/profile/profile_controller.dart';
import 'package:get/get.dart';

class ListViewSettings extends StatefulWidget {
  const ListViewSettings({Key? key}) : super(key: key);

  @override
  State<ListViewSettings> createState() => _ListViewSettingsState();
}

class _ListViewSettingsState extends State<ListViewSettings> {
  ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            padding: const EdgeInsets.all(8),
            children: ListTile.divideTiles(tiles: [
              const ListTile(
                  title: Text("Set price"),
                  leading: Icon(Icons.bookmark_border),
                  trailing: Icon(Icons.arrow_forward_ios)),
              const ListTile(
                  title: Text("Select interests"),
                  leading: Icon(Icons.bookmark_border),
                  trailing: Icon(Icons.arrow_forward_ios)),
              const ListTile(
                  title: Text("Earnings"),
                  leading: Icon(Icons.payments_outlined),
                  trailing: Icon(Icons.arrow_forward_ios)),
              ListTile(
                title: const Text("Logout"),
                leading: const Icon(Icons.power_settings_new),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  controller.logout();
                },
              ),
            ], context: context)
                .toList()),
      ),
    );
  }
}
