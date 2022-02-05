import 'package:flutter/material.dart';

class KnowRightsPage extends StatefulWidget {
  const KnowRightsPage({Key? key}) : super(key: key);

  @override
  _KnowRightsPageState createState() => _KnowRightsPageState();
}

class _KnowRightsPageState extends State<KnowRightsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Know Your Rights'),
      ),
      body: ListView(
        children: const [
          Text(
            'Equality of Opportunity',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

ExpansionTile(title: Text('Article 15(1) (2)')),

          Text(
            'Humane Conditions at Work',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Fundamental Duty',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Reservation of seats for Women',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
