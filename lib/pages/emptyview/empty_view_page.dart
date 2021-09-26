import 'package:flutter/material.dart';

class EmpatyViewPage extends StatefulWidget {
  final String _title;
  const EmpatyViewPage(this._title, {Key? key}) : super(key: key);

  @override
  _EmpatyViewPageState createState() => _EmpatyViewPageState();
}

class _EmpatyViewPageState extends State<EmpatyViewPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget._title),
    );
  }
}
