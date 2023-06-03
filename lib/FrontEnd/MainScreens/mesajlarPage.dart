import 'package:flutter/material.dart';

import 'common_bg_appb.dart';

class MesajlarPage extends StatefulWidget {
  const MesajlarPage({Key? key}) : super(key: key);

  @override
  _MesajlarPageState createState() => _MesajlarPageState();
}

class _MesajlarPageState extends State<MesajlarPage> {
  Widget buildAppBar() => appBar(context);
  Widget buildBackground() => background(context);
  Widget buildBottomNav() => bottomNav(context);

  Widget buildMessageList() {
    // Replace this with your actual implementation of the message list
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 13,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Text('Message $index'),
        );
      },
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
        body: Stack(
          children: [
            buildBackground(),
            SingleChildScrollView(
              child: buildMessageList(),
            ),
          ],
        ),
      ),
    );
  }
}
