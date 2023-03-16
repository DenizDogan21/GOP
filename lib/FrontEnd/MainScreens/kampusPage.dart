import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'common_bg_appb.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget buildAppBar() => appBar(context);
  Widget buildBackground() => background(context);
  Widget buildBottomNav() => bottomNav(context);

  final List<String> imageList = [
    "https://www.anadolu.edu.tr/uploads/anadolu/galeri/photos/5531095733fc1.JPG",
    "https://media.istockphoto.com/photos/happy-students-walking-together-in-campus-having-break-picture-id1165683016",
    "https://www.emu.edu.tr/media/gallery_media/media_795_3.jpg",
    "https://yeditepe.edu.tr/sites/default/files/dsc_5754.jpg",
    "https://yeditepe.edu.tr/sites/default/files/dsc09124.jpg",
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
