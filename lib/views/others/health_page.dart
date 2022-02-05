import 'package:flutter/material.dart';
import 'package:shecan/widgets/cards/blogCard.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Healthcare'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Articles',
              ),
              Tab(
                text: 'Doctors',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: [
                BlogCard(
                    image:
                        'https://www.publicdomainpictures.net/pictures/320000/nahled/background-image.png',
                    title: 'as'),
                BlogCard(
                    image:
                        'https://www.publicdomainpictures.net/pictures/320000/nahled/background-image.png',
                    title: 'as'),
                BlogCard(
                    image:
                        'https://www.publicdomainpictures.net/pictures/320000/nahled/background-image.png',
                    title: 'as'),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text('Dr.Janet'),
                  subtitle: Text('Cardiologist'),
                  trailing: IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {},
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://www.publicdomainpictures.net/pictures/320000/nahled/background-image.png'),
                  ),
                ),
                ListTile(
                  title: Text('Dr.Janet'),
                  subtitle: Text('Cardiologist'),
                  trailing: IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {},
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://www.publicdomainpictures.net/pictures/320000/nahled/background-image.png'),
                  ),
                ),
                ListTile(
                  title: Text('Dr.Janet'),
                  subtitle: Text('Cardiologist'),
                  trailing: IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {},
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://www.publicdomainpictures.net/pictures/320000/nahled/background-image.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
