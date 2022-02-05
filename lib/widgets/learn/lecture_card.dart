import 'package:flutter/material.dart';

class LectureCard extends StatelessWidget {
  const LectureCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 170.0,
        height: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Image.network(
                'https://www.mail-signatures.com/wp-content/uploads/2019/02/How-to-find-direct-link-to-image_Blog-Picture.png',
              ),
            ),
            Text('title'),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('beginner'),
                  Text('2hrs'),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.blue[700],
                child: Center(
                  child: Text(
                    'Watch Lecture',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
