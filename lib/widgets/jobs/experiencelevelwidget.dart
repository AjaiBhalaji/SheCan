import 'package:flutter/material.dart';

class ExperienceLevelWidget extends StatefulWidget {
  const ExperienceLevelWidget({
    Key? key,
  }) : super(key: key);

  @override
  _ExperienceLevelWidgetState createState() => _ExperienceLevelWidgetState();
}

class _ExperienceLevelWidgetState extends State<ExperienceLevelWidget> {
  int _active = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _active = 0;
              });
            },
            child: Text(
              "Entry Level",
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _active = 1;
              });
            },
            child: Text(
              "Mid Level",
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _active = 2;
              });
            },
            child: Text(
              "Senior Level",
            ),
          ),
        ],
      ),
    );
  }
}
