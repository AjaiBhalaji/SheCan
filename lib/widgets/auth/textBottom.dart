// TODO Implement this library.import 'package:flutter/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/constants/colorConst.dart';

Widget RichTextBox(String frontline, String clickable, Function onPress) {
  return RichText(
      text: TextSpan(children: [
    TextSpan(
        text: frontline,
        style: TextStyle(
          color: Colors.black,
        )),
    TextSpan(
      text: clickable,
      style: authStyle,
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          print('tapped');
          onPress();
        },
    ),
  ]));
}
