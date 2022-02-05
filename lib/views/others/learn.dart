import 'package:flutter/material.dart';
import 'package:shecan/widgets/learn/cat_row.dart';
import 'package:shecan/widgets/learn/lecture_card.dart';
import 'package:shecan/widgets/learn/search_bar.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            child: searchBar(),
          ),
          Text(
            'Categories',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey[400],
            height: 100.0,
            child: categoryRow(),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Recommended Lectures',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: [
              LectureCard(),
              LectureCard(),
              LectureCard(),
            ],
          )
        ],
      ),
    ));
  }
}
