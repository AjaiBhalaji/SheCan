import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const List<String> userImages = [
  'https://randomuser.me/api/portraits/med/women/75.jpg',
  'https://randomuser.me/api/portraits/med/women/12.jpg',
  'https://randomuser.me/api/portraits/med/women/16.jpg'
];
const List<String> users = ['Sherlin', 'Kaviya', 'Aruvi'];
const List<String> images = [
  'https://globalbusinesscoalition.org/wp-content/uploads/2017/06/G7-2017.jpg',
  'https://globalbusinesscoalition.org/wp-content/uploads/2017/06/G7-2017.jpg',
  'https://globalbusinesscoalition.org/wp-content/uploads/2017/06/G7-2017.jpg'
];
const List<String> captions = [
  'Attend the conference today, it was great to know about the environment',
  'Attend the conference today, it was great to know about the environment',
  'Attend the conference today, it was great to know about the environment'
];

class PostCard extends StatelessWidget {
  final _dummyAvatar =
      'https://static.wikia.nocookie.net/inuyasha/images/b/b5/Inuyasha.png/revision/latest?cb=20151128185518';
  final _dummyImage =
      'https://i1.wp.com/butwhythopodcast.com/wp-content/uploads/2020/09/maxresdefault-28.jpg?fit=1280%2C720&ssl=1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Community'),
      ),
      body: _postsListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _postAuthorRow(BuildContext context, String auth, String userimg) {
    const double avatarDiameter = 44;
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: avatarDiameter,
              height: avatarDiameter,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarDiameter / 2),
                child: CachedNetworkImage(
                  imageUrl: userimg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            auth,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget _postImage(String image) {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: image,
      ),
    );
  }

  Widget _postCaption(String caption) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(
        caption,
      ),
    );
  }

  Widget _postView(BuildContext context, String auth, String userimg,
      String image, String caption) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow(context, auth, userimg),
        _postImage(image),
        _postCaption(caption),
        _postCommentsButton(context),
      ],
    );
  }

  Widget _postCommentsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'View Comments',
          style: TextStyle(fontWeight: FontWeight.w200),
        ),
      ),
    );
  }

  Widget _postsListView(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return _postView(context, users[index], userImages[index],
              images[index], captions[index]);
        });
  }
}
