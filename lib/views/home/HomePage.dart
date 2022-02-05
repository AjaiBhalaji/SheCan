import 'package:flutter/material.dart';
import 'package:shecan/configs/routes/routes.dart';
import 'package:shecan/widgets/home/CarouselSliderIndicator.dart';
import 'package:shecan/widgets/home/FeaturesCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SheCan'),
        actions: [
          InkWell(
              child: CircleAvatar(),
              onTap: () {
                Navigator.pushNamed(context, profileRoute);
              }),
          SizedBox(
            width: 10,
          ),
          IconButton(icon: Icon(Icons.info), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upcoming events',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CarouselWithIndicatorDemo(),
            const Text(
              'Explore',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          menuContainer(Icons.health_and_safety, 'Health', () {
                            Navigator.pushNamed(context, healthRoute);
                          }),
                          menuContainer(Icons.help_center_outlined, 'Services',
                              () {
                            Navigator.pushNamed(context, getHelpRoute);
                          }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          menuContainer(Icons.leaderboard_outlined, 'Learn',
                              () {
                            Navigator.pushNamed(context, learnRoute);
                          }),
                          menuContainer(Icons.find_in_page_sharp, 'Jobs', () {
                            Navigator.pushNamed(context, jobsRoute);
                          }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          menuContainer(
                              Icons.phonelink_lock_outlined, 'Know Rights', () {
                            Navigator.pushNamed(context, knowRightsRoute);
                          }),
                          menuContainer(Icons.people_alt, 'Community', () {
                            Navigator.pushNamed(context, communityRoute);
                          }),
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
