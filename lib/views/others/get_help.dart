import 'package:flutter/material.dart';
import 'package:shecan/widgets/cards/card_horizontal.dart';
import 'package:shecan/widgets/cards/hospital_card.dart';
import 'package:shecan/widgets/cards/police_card.dart';

const List<HospitalCard> hospitals = [
  HospitalCard(
    imageName:
        'https://content3.jdmagicbox.com/comp/chennai/75/044p7010475/catalogue/apollo-hospitals-tondiarpet-chennai-multispeciality-hospitals-bg3ijbtypr.jpg?clr=3b2b3b',
    hospitalName: 'Apollo Hospital',
    hospitalArea: '21, Greams Lane, Off Greams Road,, 600006, Chennai',
  ),
  HospitalCard(
    imageName:
        'https://content3.jdmagicbox.com/comp/chennai/k3/044pxx44.xx44.170706111526.y3k3/catalogue/dr-venkateswaran-a-r-lifeline-multispeciality-rigid-hospitals-kilpauk-chennai-gastroenterologists-ip6oj9du4n.jpg',
    hospitalName: 'LifeLine Hospitals',
    hospitalArea: '47/3, New Avadi Rd, Alagappa Nagar, Kilpauk, Chennai',
  ),
  HospitalCard(
    imageName:
        'https://res.cloudinary.com/doczo/image/upload/v1628963995/hospitals/kauvery-hospital-chennai.jpg',
    hospitalName: 'Kauvery Hospital',
    hospitalArea: 'No.199, Luz Church Road,Mylapore,Chennai',
  ),
];

List<PoliceCard> police = [
  PoliceCard(
    title: 'D4 Police Station',
    area: '222,Padupakkam, Royapettah, Chennai,',
    distance: '10 km',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmWVV8aTz4s4tiVyrTMQH4soTFspQobh5mQA&usqp=CAU',
  ),
  PoliceCard(
    title: 'Police R 4',
    area: 'No 68, Parthasarathi Puram, T. Nagar',
    distance: '40 km',
    image:
        'https://1.bp.blogspot.com/-__t4hYyfGh4/YP6yl8hJJVI/AAAAAAAAvWQ/qkeuJl9ZVf8f_ZBtyhOoL83EezAenJx5gCLcBGAsYHQ/s640/201804151453205995_Chindadripet._L_styvpf.gif',
  ),
  PoliceCard(
    title: 'K4 Police Station',
    area: '6th Ave, Anna Nagar, Annanagar East, Chennai',
    distance: '30 km',
    image:
        'https://www.findeasy.in/wp-content/uploads/2020/07/Chennai-Police.jpg',
  ),
];

List<CardHorizontal> offices = [
  CardHorizontal(
    title: "Tamil Nadu Public Service Commission",
    cta: "View more",
    img:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS-H4bBMAzh2Q1ILQf-wqm1ZwtTKpSK_HWIg&usqp=CAU',
    tap: () {},
  ),
  CardHorizontal(
    title: "Tamil Nadu Public Works Department",
    cta: "View more",
    img:
        'https://thumbs.dreamstime.com/b/public-works-department-chennai-tamil-nadu-india-front-entrance-public-services-department-building-near-ma-public-works-182940102.jpg',
    tap: () {},
  ),
  CardHorizontal(
    title: "Commissioner Office",
    cta: "View more",
    img:
        'https://img.dtnext.in/Images/Article/201603042130126023_DSPs-soninlaw-seeks-protection-for-wife_SECVPF.gif',
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
