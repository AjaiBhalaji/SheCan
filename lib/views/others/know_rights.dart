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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              'Equality of Opportunity',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ExpansionTile(title: Text('Article 16'), children: [
              Text(
                  ' provides for equality of opportunity for all citizens in matters relating to employment or appointment to any office under the State.'),
            ]),
            ExpansionTile(title: Text('Article 39'), children: [
              Text(
                  'requires the State to direct its policy towards securing for men and women equally the right to an adequate means of livelihood [Article 39(a)]:, and equal pay for equal work for both men and women'),
            ]),
            ExpansionTile(
                title: Text('Article 39A'),
                childrenPadding: EdgeInsets.all(8.0),
                children: [
                  Text(
                      'directs the State to promote justice, on the basis of equal opportunity and to promote free legal aid by suitable legislation or scheme or in any other way to ensure that opportunities for securing justice are not denied to any citizen by reason of economic or other disabilities.'),
                ]),
            //2
            Divider(
              thickness: 2,
            ),
            Text(
              'Humane Conditions at Work',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            ExpansionTile(title: Text('Article 42'), children: [
              Text(
                  'directs the State to make provision for securing justice and humane conditions of work and for maternity relief.'),
            ]),
            Divider(
              thickness: 2,
            ),
            Text(
              'Fundamental Duty',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            ExpansionTile(title: Text('Article 51A (e)'), children: [
              Text(
                  'enjoins upon every citizen to renounce practices derogatory to the dignity of women.'),
            ]),
            Divider(
              thickness: 2,
            ),
            Text(
              'Reservation of seats for Women',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            ExpansionTile(title: Text('Article 243 D (3) '), children: [
              Text(
                  ' provide for reservation of not less than one third of total number of seats in Panchayats and Municipalities for women to be allotted by rotation to different Constituencies.'),
            ]),

            ExpansionTile(title: Text('Article 243 D(4) T(4)'), children: [
              Text(
                  'provides that not less than one third of the total number of officers of chairperson in the Panchayat and Municipalities at each level to be reserved for women.'),
            ]),

            //39
            Divider(
              thickness: 2,
            ),
            Text(
              'Equality before law',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ExpansionTile(title: Text('Article 15(1) and (2)'), children: [
              Text(
                  'prohibits the state from discriminating against any citizen only on the basis of any one or more of the aspects such as religion, race, caste, sex, place of birth or any of them.'),
            ]),
            ExpansionTile(title: Text('Article 15(3) '), children: [
              Text(
                  'makes it possible for the state to create special provisions for protecting the interests of women and children.'),
            ]),
            ExpansionTile(title: Text('Article 15(4) '), children: [
              Text(
                  'capacitates the State to create special arrangements for promoting interests and welfare of socially and educationally backward classes of society.'),
            ]),
          ],
        ),
      ),
    );
  }
}
