import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/MainScreens/common_main_methods.dart';

class PartTimeIslerPage extends StatefulWidget {
  const PartTimeIslerPage({Key? key}) : super(key: key);

  @override
  _PartTimeIslerPageState createState() => _PartTimeIslerPageState();
}

class _PartTimeIslerPageState extends State<PartTimeIslerPage> {
  Widget buildAppBar() => appBar(context);
  Widget buildBackground() => background(context);
  Widget buildBottomNav() => bottomNav(context);

  final List<String> imageList = [
    "https://www.yeniisilanlari.com/wp-content/uploads/2018/04/ElmBuyukGorsel.jpg",
    "https://kampusetkinlikleri.com/img/Etkinlik/Thumb/ankara-universitesi-bilisim-gunleri-bi-gun-ankara-20190513-024333.jpg",
    "https://pbs.twimg.com/media/EJUaqEdXkAAKf4B.jpg",
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
