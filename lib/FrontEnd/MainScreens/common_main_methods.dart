import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/AuthUI/loginScreen.dart';
import 'package:gop/FrontEnd/Popup/canliVideolarPage.dart';
import 'package:gop/FrontEnd/Popup/etkinliklerPage.dart';
import 'package:gop/FrontEnd/Popup/goruntuluKonusmaPage.dart';
import 'package:gop/FrontEnd/Popup/kullaniciAyarlariPage.dart';
import 'package:gop/FrontEnd/Popup/partTimeIslerPage.dart';
import 'package:gop/FrontEnd/Popup/profilPage.dart';
import 'package:gop/FrontEnd/Popup/topluluklarPage.dart';
import 'package:gop/FrontEnd/Popup/yakinimdakiArkadaslarPage.dart';

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
        print("Pressed Etkinlikler");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => EtkinliklerPage()));
        break;
      case 1:
        print("Pressed Yakınımdaki Arkadaşlar");
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => YakinimdakiArkadaslarPage()));
        break;
      case 2:
        print("Pressed Part Time İşler");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => PartTimeIslerPage()));
        break;
      case 3:
        print("Pressed Topluluklar");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => TopluluklarPage()));
        break;
      case 4:
        print("Pressed Canlı Videolar");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CanliVideolarPage()));
        break;
      case 5:
        print("Pressed Kullanıcı Ayarları");
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => KullaniciAyarlariPage()));
        break;
      case 6:
        print("Pressed Profil");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ProfilPage()));
        break;
      case 7:
        print("Pressed Görüntülü Konuşma");
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => GoruntuluKonusmaPage()));
        break;
      case 8:
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
          textTheme: TextTheme().apply(bodyColor: Colors.white),
        ),
        child: PopupMenuButton<int>(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Icon(Icons.menu),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          color: Colors.orange,
          onSelected: (item) => onSelected(context, item),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 0,
              child: Text("Etkinlikler"),
              height: 45,
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              value: 1,
              child: Text("Yakınımdaki Arkadaşlar"),
              height: 45,
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              value: 2,
              child: Text("Part Time İşler"),
              height: 45,
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              value: 3,
              child: Text("Topluluklar"),
              height: 45,
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              value: 4,
              child: Text("Canlı Videolar"),
              height: 45,
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              value: 5,
              child: Text("Kullanıcı Ayarları"),
              height: 45,
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              value: 6,
              child: Text("Profil"),
              height: 45,
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              value: 7,
              child: Text("Görüntülü Konuşma"),
              height: 45,
            ),
            PopupMenuDivider(
              height: 20,
            ),
            PopupMenuItem(
              height: 45,
              value: 8,
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 8,
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

@override
Widget bottomNav(BuildContext context) {
  int currentIndex = 0;
  return BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: (index) => setState(() => currentIndex = index),
    backgroundColor: Colors.white,
    selectedItemColor: Colors.amber[800],
    unselectedItemColor: Colors.amber[400],
    showUnselectedLabels: false,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "kampüs",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.photo_camera_sharp),
        label: "kamera",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        label: "mesajlar",
      ),
    ],
  );
}

setState(int Function() param0) {
  print("pressed");
}
