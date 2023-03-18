import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gop/FrontEnd/MainScreens/common_bg_appb.dart';

class CanliVideolarPage extends StatefulWidget {
  const CanliVideolarPage({Key? key}) : super(key: key);

  @override
  _CanliVideolarPageState createState() => _CanliVideolarPageState();
}

class _CanliVideolarPageState extends State<CanliVideolarPage> {
  Widget buildAppBar() => appBar(context);
  Widget buildBackground() => background(context);
  Widget buildBottomNav() => bottomNav(context);

  final List<String> imageList = [
    'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/6197v9EtYEL._AC_UF1000,1000_QL80_.jpg',
    'https://st3.depositphotos.com/5739646/32145/v/1600/depositphotos_321453638-stock-illustration-basketball-tournament-modern-sports-posters.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Video_Camera_Live.svg/200px-Video_Camera_Live.svg.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: buildAppBar(),
        ),
        bottomNavigationBar: buildBottomNav(),
        body: Stack(children: [
          buildBackground(),
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                  padEnds: false,
                  scrollDirection: Axis.vertical,
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  height: double.maxFinite,
                  viewportFraction: 1),
              items: imageList
                  .map((e) => Container(
                          child: SizedBox(
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            IconButton(
                              icon: Image.network(
                                e,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                              onPressed: () {
                                print("pressed the image");
                              },
                            ),
                          ],
                        ),
                      )))
                  .toList(),
            ),
          ),
        ]),
      ),
    );
  }
}
