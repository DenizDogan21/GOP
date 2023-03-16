import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/MainScreens/common_bg_appb.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
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
