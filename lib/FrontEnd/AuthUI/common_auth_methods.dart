import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/AuthUI/signUpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginScreen.dart';

Widget commonTextFormField(
    {required String hintText,
    required icon,
    required tf,
    required String? Function(String?)? validator,
    required TextEditingController textEditingController}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextFormField(
          validator: validator,
          controller: textEditingController,
          obscureText: tf,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(icon, color: Color(0XFFf0952e)),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0XFFE3A8DE),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget switchAnotherAuthScreen(BuildContext context, String buttonName) {
  return ElevatedButton(
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        buttonName,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ]),
    style: ElevatedButton.styleFrom(
        elevation: 0.0, primary: Color.fromRGBO(0, 0, 0, 0)),
    onPressed: () {
      if (buttonName == 'Henüz bir hesabın yok mu ?')
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SignUpScreen()));
      else
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
    },
  );
}

Future<void> saveCredentials(String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
  await prefs.setString('password', password);
}

