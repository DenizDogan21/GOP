import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/MainScreens/common_main_methods.dart';

class TopluluklarPage extends StatefulWidget {
  const TopluluklarPage({Key? key}) : super(key: key);

  @override
  _TopluluklarPageState createState() => _TopluluklarPageState();
}

class _TopluluklarPageState extends State<TopluluklarPage> {
  Widget buildAppBar() => appBar(context);
  Widget buildBackground() => background(context);
  Widget buildBottomNav() => bottomNav(context);

  final List<String> imageList = [
    "https://i.ytimg.com/vi/UaJ2rZlvtBk/maxresdefault.jpg",
    "https://kampusetkinlikleri.com/img/Etkinlik/Big/i.-ulusal-universite-ogrenci-topluluklari-calistayi-20190214-030605.jpg",
    "https://ab-ilan.com/wp-content/uploads/2022/02/gfh-1.jpg",
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
          Container(),
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
