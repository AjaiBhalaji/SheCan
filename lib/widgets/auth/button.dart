import 'package:flutter/material.dart';
import '/constants/colorConst.dart';

Widget AuthButton(String title, onpress, mediaQuery) {
  return Container(
    width: mediaQuery.width * 0.48,
    child: RaisedButton(
      onPressed: onpress,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
      padding: const EdgeInsets.all(14),
      color: authColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget AuthButtonNav(
    String title, Function onpress, mediaQuery, wid, pad, fsize) {
  return Container(
    width: mediaQuery.width * wid,
    child: RaisedButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: fsize),
      ),
      padding: EdgeInsets.all(pad),
      color: authColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget AuthButtonFull(String title, Function? onpress) {
  return Container(
    padding: const EdgeInsets.all(8),
    width: double.infinity,
    child: RaisedButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
      padding: const EdgeInsets.all(14),
      color: authColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
