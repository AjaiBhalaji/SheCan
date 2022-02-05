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
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.13,
          child: searchBar(),
        ),
        Text('Categories'),
        Container(
          height: 100.0,
          child: categoryRow(),
        ),
        Text('Recommended Lectures'),
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
    ));
  }
}
