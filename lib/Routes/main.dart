import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gop/FrontEnd/AuthUI/signUpScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gather Other People',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SignUpScreen(),
    );
  }
}
