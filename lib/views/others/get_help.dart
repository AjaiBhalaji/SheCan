import 'package:flutter/material.dart';
import 'package:shecan/widgets/cards/card_horizontal.dart';
import 'package:shecan/widgets/cards/hospital_card.dart';
import 'package:shecan/widgets/cards/police_card.dart';

const List<HospitalCard> hospitals = [
  HospitalCard(
    imageName:
        'https://image.shutterstock.com/image-photo/modern-hospital-style-building-260nw-212251981.jpg',
    hospitalName: 'hospitalName',
    hospitalArea: 'Area',
  ),
  HospitalCard(
    imageName:
        'https://image.shutterstock.com/image-photo/modern-hospital-style-building-260nw-212251981.jpg',
    hospitalName: 'hospitalName',
    hospitalArea: 'Area',
  ),
  HospitalCard(
    imageName:
        'https://image.shutterstock.com/image-photo/modern-hospital-style-building-260nw-212251981.jpg',
    hospitalName: 'hospitalName',
    hospitalArea: 'Area',
  ),
];

List<PoliceCard> police = [
  PoliceCard(
    title: 'Police Station',
    area: 'Area',
    distance: '10 km',
    image:
        'https://assets.thehansindia.com/h-upload/2019/12/08/243243-police-station.webp',
  ),
  PoliceCard(
    title: 'Police Station',
    area: 'Area',
    distance: '10 km',
    image:
        'https://assets.thehansindia.com/h-upload/2019/12/08/243243-police-station.webp',
  ),
  PoliceCard(
    title: 'Police Station',
    area: 'Area',
    distance: '10 km',
    image:
        'https://assets.thehansindia.com/h-upload/2019/12/08/243243-police-station.webp',
  ),
];

List<CardHorizontal> offices = [
  CardHorizontal(
    title: "Office name",
    cta: "View more",
    img:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS-H4bBMAzh2Q1ILQf-wqm1ZwtTKpSK_HWIg&usqp=CAU',
    tap: () {},
  ),
  CardHorizontal(
    title: "Office name",
    cta: "View more",
    img:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS-H4bBMAzh2Q1ILQf-wqm1ZwtTKpSK_HWIg&usqp=CAU',
    tap: () {},
  ),
  CardHorizontal(
    title: "Office name",
    cta: "View more",
    img:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS-H4bBMAzh2Q1ILQf-wqm1ZwtTKpSK_HWIg&usqp=CAU',
    tap: () {},
  ),
];

class GethelpPage extends StatefulWidget {
  const GethelpPage({Key? key}) : super(key: key);

  @override
  _GethelpPageState createState() => _GethelpPageState();
}

class _GethelpPageState extends State<GethelpPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Get Help'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Hospitals',
              ),
              Tab(
                text: 'Nearby Police',
              ),
              Tab(
                text: 'Offices ',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: hospitals,
            ),
            ListView(
              children: police,
            ),
            ListView(
              children: offices,
            ),
          ],
        ),
      ),
    );
  }
}
