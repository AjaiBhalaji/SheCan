import 'package:flutter/material.dart';

Widget menuContainer(icon, title, onPressed) {
  return Container(
    width: 110,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.pinkAccent,
        width: 1.1,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: FlatButton(
      onPressed: onPressed,
      child: Wrap(
        spacing: 20,
        direction: Axis.horizontal,
        children: [
          Center(
            child: Icon(
              icon,
              size: 30,
            ),
          ),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
