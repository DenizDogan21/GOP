import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/MainScreens/common_main_methods.dart';

class KullaniciAyarlariPage extends StatefulWidget {
  const KullaniciAyarlariPage({Key? key}) : super(key: key);

  @override
  _KullaniciAyarlariPageState createState() => _KullaniciAyarlariPageState();
}

class _KullaniciAyarlariPageState extends State<KullaniciAyarlariPage> {
  Widget buildAppBar() => appBar(context);
  Widget buildBackground() => background(context);
  Widget buildBottomNav() => bottomNav(context);

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
        ]),
      ),
    );
  }
}
