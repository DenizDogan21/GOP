import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/MainScreens/common_bg_appb.dart';

class GoruntuluKonusmaPage extends StatefulWidget {
  const GoruntuluKonusmaPage({Key? key}) : super(key: key);

  @override
  _GoruntuluKonusmaPageState createState() => _GoruntuluKonusmaPageState();
}

class _GoruntuluKonusmaPageState extends State<GoruntuluKonusmaPage> {
  Widget buildAppBar() => appBar(context);
  Widget buildBackground() => background(context);
  Widget buildBottomNav() => bottomNav(context);

  final List<String> imageList = [
    "https://st.depositphotos.com/12121852/51307/v/600/depositphotos_513072960-stock-video-middle-aged-man-talking-on.jpg",
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
                scrollDirection: Axis.vertical,
                enableInfiniteScroll: false,
                height: 2000,
                autoPlay: false,
              ),
              items: imageList
                  .map((e) => ClipRRect(
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            IconButton(
                              icon: Image.network(
                                e,
                              ),
                              onPressed: () {
                                print("pressed the image");
                              },
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ]),
      ),
    );
  }
}
