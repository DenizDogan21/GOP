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

  List imageList = [
    {
      "id": 1,
      "image_path":
          'https://www.gergitavan.net/wp-content/uploads/2019/01/S-131922689.jpg'
    },
    {
      "id": 2,
      "image_path":
          'https://cdn.webrazzi.com/uploads/2020/05/instagram-canli-yayin-rozet-441.png'
    },
    {
      "id": 3,
      "image_path":
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Video_Camera_Live.svg/200px-Video_Camera_Live.svg.png'
    },
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

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
          InkWell(
            onTap: () {
              print(currentIndex);
            },
            child: CarouselSlider(
              items: imageList
                  .map(
                    (item) => Image.asset(
                      item['image_path'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key ? 17 : 7,
                    height: 7.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == entry.key
                            ? Colors.red
                            : Colors.teal),
                  ),
                );
              }).toList(),
            ),
          ),
        ]),
      ),
    );
  }
}
