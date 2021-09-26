import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ListTile(
            title: Text("Set price"),
            leading: Icon(Icons.bookmark_border),
            trailing: Icon(Icons.arrow_forward_ios)),
        ListTile(
            title: Text("Select interests"),
            leading: Icon(Icons.bookmark_border),
            trailing: Icon(Icons.arrow_forward_ios)),
        ListTile(
            title: Text("Earnings"),
            leading: Icon(Icons.bookmark_border),
            trailing: Icon(Icons.arrow_forward_ios)),
        ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.power_settings_new),
            trailing: Icon(Icons.arrow_forward_ios))
      ],
    );
  }
}
