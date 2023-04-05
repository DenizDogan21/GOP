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
    "https://st.depositphotos.com/57718742/58208/i/600/depositphotos_582085924-stock-photo-vertical-selfie-portrait-young-african.jpg",
    "https://img.freepik.com/free-photo/smiley-man-taking-selfie-outdoors-medium-shot_23-2149556990.jpg?w=2000"
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
