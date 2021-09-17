import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:travel/theme.dart';

class TravelFlushbar {
  static showCorpBar(BuildContext context, String title, String? desc,
      {bool success = false}) {
    Flushbar(
      title: title,
      message: desc,
      borderRadius: BorderRadius.circular(8),
      duration: Duration(seconds: 3),
      backgroundColor: success ? pink : red,
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
    )..show(context);
  }
}
