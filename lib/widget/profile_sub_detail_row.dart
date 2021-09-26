import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileSubDetailRow extends StatefulWidget {
  String firstKey;
  String firstValue;
  String secodKey;
  String secondValue;
  Icon? firstIcon;
  Icon? seconIcon;
  ProfileSubDetailRow(
      this.firstKey, this.firstValue, this.secodKey, this.secondValue,
      {Key? key, this.firstIcon, this.seconIcon})
      : super(key: key);

  @override
  _ProfileSubDetailRowState createState() => _ProfileSubDetailRowState();
}

class _ProfileSubDetailRowState extends State<ProfileSubDetailRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      widget.firstIcon ?? const SizedBox(),
                      const SizedBox(width: 2.0,),
                      Text(widget.firstKey),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(widget.firstValue,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      widget.seconIcon ?? const SizedBox(),
                      const SizedBox(width: 2.0,),
                      Text(widget.secodKey),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(
                    widget.secondValue,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
