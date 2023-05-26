import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/AuthUI/loginScreen.dart';
import 'package:gop/FrontEnd/Popup/canliVideolarPage.dart';
import 'package:gop/FrontEnd/Popup/goruntuluKonusmaPage.dart';
import 'package:gop/FrontEnd/Popup/kullaniciAyarlariPage.dart';
import 'package:gop/FrontEnd/Popup/profilPage.dart';
import 'package:gop/FrontEnd/MainScreens/mesajlarPage.dart';
import 'package:gop/FrontEnd/MainScreens/kampusPage.dart';
import 'package:gop/FrontEnd/MainScreens/kameraPage.dart';

Widget background(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0X66f0952e),
                    Color(0X99f0952e),
                    Color(0XCCf0952e),
                    Color(0XFFf0952e),
                  ]),
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget appBar(BuildContext context) {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print("Pressed Canlı Videolar");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CanliVideolarPage()));
        break;
      case 1:
        print("Pressed Görüntülü Konuşma");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => GoruntuluKonusmaPage()));
        break;
      case 2:
        print("Pressed Profil");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ProfilPage()));
        break;
      case 3:
        print("Pressed Kullanıcı Ayarları");
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => KullaniciAyarlariPage()));
        break;
      case 4:
        print("Pressed Çıkış");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
        break;
    }
  }

  return AppBar(
    foregroundColor: Colors.amber[800],
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ),
    title: TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Ara...',
        hintStyle: TextStyle(
          color: Colors.amber[400],
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
    actions: [
      Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.amber[800]),
          textTheme: TextTheme().apply(bodyColor: Colors.amber[400]),
          selectedRowColor: Colors.amber
        ),
        child: PopupMenuButton<int>(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Icon(Icons.menu),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2))),
          color: Colors.amber[400],
          onSelected: (item) => onSelected(context, item),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 0,
              child: Text("Canlı Videolar"),
              height: 28,
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              value: 1,
              child: Text("Görüntülü Konuşma"),
              height: 28,
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              value: 2,
              child: Text("Profil"),
              height: 28,
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              value: 3,
              child: Text("Kullanıcı Ayarları"),
              height: 28,
            ),
            PopupMenuDivider(
              height: 20,
            ),
            PopupMenuItem(
              height: 28,
              value: 4,
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  Text("Çıkış"),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
/*
Widget bottomNav(BuildContext context) {
  return GNav(
    currentIndex:
      padding: EdgeInsets.all(16),
      backgroundColor: Colors.white,
      activeColor: Colors.amber[800],
      color: Colors.amber[400],
      tabBackgroundColor: Colors.amberAccent,
      tabBorderRadius: 13,
      onTabChange: (index) {
        print(index);
      },
      tabs: [
        GButton(
          icon: Icons.home,
          text: 'Kampüs',
        ),
        GButton(
          icon: Icons.photo_camera_sharp,
          text: 'Kamera',
        ),
        GButton(
          icon: Icons.message,
          text: 'Mesajlar',
        ),
      ]);
} */

Widget bottomNav(BuildContext context) {
  return BottomNavigationBar(
    backgroundColor: Colors.white,
    fixedColor: Colors.amber[600],
    showUnselectedLabels: false,
    showSelectedLabels: false,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.photo_camera_sharp),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        label: "",
      ),
    ],
    onTap: (int index) {
      // Handle navigation based on the tapped item
      switch (index) {
      case 0:
      // Navigate to "kampüs" page
      Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
      );
      break;
      case 1:
      // Navigate to "kamera" page
      Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => KameraPage()),);
      break;
      case 2:
      // Navigate to "mesajlar" page
      Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MesajlarPage()),
      );
      break;
      }
    },
  );
}



