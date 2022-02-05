import 'package:flutter/material.dart';
import 'package:shecan/helpers/sharedPrefs.dart';
import 'package:shecan/models/user_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: FutureBuilder(
          future: SharedPrefs.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                UserProfile? prof = snapshot.data as UserProfile?;
                return ListView(
                  children: [
                    ListTile(
                      title: Text('Name'),
                      subtitle: Text(prof!.name),
                    ),
                    ListTile(
                      title: Text('Phone'),
                      subtitle: Text(prof.phone),
                    ),
                    ListTile(
                      title: Text('Age'),
                      subtitle: Text(prof.age),
                    ),
                    ListTile(
                      title: Text('Location'),
                      subtitle: Text("Karur"),
                    ),
                    ListTile(
                      title: Text('Preferred Language'),
                      subtitle: Text("English"),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text('No data'),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
