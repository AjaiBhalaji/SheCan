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
                        'https://images.everydayhealth.com/images/a-diet-rich-in-fiber-may-help-lower-depression-risk-1440x810.jpg',
                    title: 'A High-Fiber Diet May Help Lower Depression Risk'),
                BlogCard(
                    image:
                        'https://image.shutterstock.com/image-vector/open-palms-female-silhouette-glyph-260nw-723726370.jpg',
                    title: 'How are Women`s rights being violated?'),
                BlogCard(
                    image:
                        'https://ychef.files.bbci.co.uk/976x549/p067slp9.jpg',
                    title: 'Journal of Women`s Health'),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text('Dr.Alex'),
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
                  title: Text('Dr.H. S. Chhabra'),
                  subtitle: Text('Spine Surgeon'),
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
                  title: Text('Dr.Dr. Sandeep Vaishya'),
                  subtitle: Text('Neurosurgeon'),
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
