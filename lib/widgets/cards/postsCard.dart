import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const List<String> userImages = [
  'https://randomuser.me/api/portraits/med/women/75.jpg',
  'https://randomuser.me/api/portraits/med/women/12.jpg',
  'https://randomuser.me/api/portraits/med/women/20.jpg'
];
const List<String> users = ['Sherlin', 'Kaviya', 'Catherine'];
const List<String> images = [
  'https://static.vecteezy.com/system/resources/previews/003/795/147/non_2x/building-knowledge-and-skill-for-success-opportunity-and-career-growth-help-create-self-motivation-and-creativity-graduated-woman-climb-stack-of-book-and-try-reaching-out-mortarboard-hanging-on-tree-vector.jpg',
  'https://img.freepik.com/free-vector/girl-fist-symbol_23-2147980803.jpg?size=338&ext=jpg',
  'https://blog-c7ff.kxcdn.com/blog/wp-content/uploads/2017/12/blog_-1.jpg'

  // 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fserudsindia.org%2Fblog%2Fwomen-empowerment-meaning-definition%2F&psig=AOvVaw0fGIO78-9n2DlqK4Zqg2YQ&ust=1644223571740000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOCPuaLY6vUCFQAAAAAdAAAAABAW',
  // 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vecteezy.com%2Fvector-art%2F3795147-building-knowledge-and-skill-for-success-opportunity-and-career-growth-help-create-self-motivation-and-creativity-graduated-woman-climb-stack-of-book-and-try-reaching-out-mortarboard-hanging-on-tree&psig=AOvVaw2qnZzd7xSokJImpbNeH1wl&ust=1644223760365000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMiQy_7Y6vUCFQAAAAAdAAAAABAL'
];
const List<String> captions = [
  'Women’s empowerment can be defined to promoting women’s sense of self-worth, their ability to determine their own choices, and their right to influence social change for themselves and others.',
  'A Woman is like a tea bag-You never know how strong she is until she gets in hot water',
  'Everyone has inside of her a piece of good news. The good news is that you don’t know how great you can be, how much you can love, what you can accomplish, and what your potential is'
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
