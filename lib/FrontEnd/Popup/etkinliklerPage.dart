import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/MainScreens/common_main_methods.dart';
import 'package:gop/Registry/etkinliklerKayit.dart';

class EtkinliklerPage extends StatefulWidget {
  const EtkinliklerPage({Key? key}) : super(key: key);

  @override
  _EtkinliklerPageState createState() => _EtkinliklerPageState();
}

class _EtkinliklerPageState extends State<EtkinliklerPage> {
  Widget buildAppBar() => appBar(context);
  Widget buildBackground() => background(context);
  Widget buildBottomNav() => bottomNav(context);

  final List<String> imageList = [
    "https://www.etmd.org.tr/wp-content/uploads/2020/01/ETMD-Universite-Kapak.jpg",
    "https://kampusetkinlikleri.com/img/Etkinlik/Thumb/ankara-universitesi-bilisim-gunleri-bi-gun-ankara-20190513-024333.jpg",
    "https://webupload.gazi.edu.tr/upload/1/2014/6/9/2c25565481e272f62760a370ad7708960c0500cc",
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
                height: double.infinity,
                enlargeCenterPage: true,
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
                                fit: BoxFit.fill,
                                height: double.infinity,
                                width: double.infinity,
                              ),
                              onPressed: () {
                                print("pressed the image");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EtkinliklerKayit()));
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
