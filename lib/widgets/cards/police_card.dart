import 'package:flutter/material.dart';

class PoliceCard extends StatelessWidget {
  final String title;
  final String area;
  final String distance;
  final String image;
  const PoliceCard(
      {Key? key,
      required this.title,
      required this.area,
      required this.distance,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Police Station',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      subtitle: Text('Area'),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            Text('10km'),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
          ],
        ),
      ),
      leading: Image.network(
        'https://assets.thehansindia.com/h-upload/2019/12/08/243243-police-station.webp',
      ),
    );
  }
}
