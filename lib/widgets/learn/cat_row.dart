import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

const List<String> categories = [
  'Language',
  'Art',
  'Marketing',
  'Law',
  'Coding',
  'Life',
  'Health',
  'Science',
  'Food',
  'Fashion',
  'Politics',
  'Economics'
];
Widget categoryRow() {
  return ListView(
      scrollDirection: Axis.horizontal,
      children: categories
          .map((e) => Card(
                color: Colors.white,
                child: new Container(
                  width: 80.0,
                  height: 50.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.sports_basketball_rounded),
                      Text("$e")
                    ],
                  ),
                ),
              ))
          .toList());
}
