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
      title: Text(title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      subtitle: Text(area),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            Text(distance),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
          ],
        ),
      ),
      leading: Image.network(
        image,
      ),
    );
  }
}
