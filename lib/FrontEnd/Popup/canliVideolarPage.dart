import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/MainScreens/common_main_methods.dart';

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
    "https://i4.hurimg.com/i/hurriyet/75/866x494/622f9b094e3fe11c60bba060.jpg",
    "https://cdn.webrazzi.com/uploads/2020/05/instagram-canli-yayin-rozet-441.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Video_Camera_Live.svg/200px-Video_Camera_Live.svg.png",
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
