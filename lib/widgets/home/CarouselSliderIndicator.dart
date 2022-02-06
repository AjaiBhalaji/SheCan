import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://pi.tedcdn.com/r/pb-assets.tedcdn.com/system/baubles/files/000/000/033/original/TEDxAmsterdamWomen_2013.jpg?width=1400',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo-xBpke93Ww03hzg2athPbbOb7A-38-7fjA&usqp=CAU',
  'https://wearethecity.com/wp-content/uploads/2021/12/OneTechWorld-featured-400x300.jpg',
  'https://wwin.org/wp-content/uploads/2020/10/wwin-banners-events-activate-you-mobile.jpg',
  'https://d3rd29nk50moi4.cloudfront.net/photos/2019/11/30/1c4265ec-ecf1-4f7b-806a-0d51be83c5eb.png',
  'https://images.squarespace-cdn.com/content/v1/55d26a74e4b0e20eb50ec095/1451081343853-JE5G41Z0NS9VUJ1CIRQR/KB_Logos6.jpg'
];
final List<String> imgTitles = [
  'TedX Amsterdam Woman',
  'Leadership Development',
  'One Tech World Conference',
  'Woman Empowerment Conference',
  'National Woman of Canabis Conference',
  'Forbes Woman Summit'
];

final List<Widget> imageSliders = imgList
    .asMap()
    .map((index, item) => MapEntry(
        index,
        Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '${imgTitles[index]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        )))
    .values
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.3,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      )
    ]);
  }
}
