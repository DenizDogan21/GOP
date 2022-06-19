import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/MainScreens/common_main_methods.dart';

class EtkinliklerKayit extends StatefulWidget {
  const EtkinliklerKayit({Key? key}) : super(key: key);

  @override
  _EtkinliklerKayitState createState() => _EtkinliklerKayitState();
}

class _EtkinliklerKayitState extends State<EtkinliklerKayit> {
  Widget buildAppBar() => appBar(context);
  Widget buildBackground() => background(context);
  Widget buildBottomNav() => bottomNav(context);

  Widget buildKayit() {
    return Center(
      child: Text(
        "SPRINT#3",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }

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
          buildKayit(),
        ]),
      ),
    );
  }
}
