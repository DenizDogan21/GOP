import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gop/FrontEnd/AuthUI/common_auth_methods.dart';
import 'package:gop/Global_Uses/enum_gop.dart';
import 'package:gop/Global_Uses/reg_exp.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Backend/firebase/Auth/sign_up_auth.dart';
import '../MainScreens/kampusPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pwd = TextEditingController();

  final EmailAndPasswordAuth _emailAndPasswordAuth = EmailAndPasswordAuth();

  bool _isLoading = false;

  Widget buildEmail() {
    return FutureBuilder<String?>(
      future: savedEmail,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _email.text = snapshot.data!; // Set initial value from saved credentials
        }
        return commonTextFormField(
          hintText: "email",
          icon: Icons.email,
          tf: false,
          validator: (String? inputVal) {
            if (!emailRegex.hasMatch(inputVal.toString()))
              return "Geçerli Bir Mail Adresi Girin";
            return null;
          },
          textEditingController: this._email,
        );
      },
    );
  }

  Widget buildPassword() {
    return FutureBuilder<String?>(
      future: savedPassword,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _pwd.text = snapshot.data!; // Set initial value from saved credentials
        }
        return commonTextFormField(
          hintText: "şifre",
          icon: Icons.lock,
          tf: true,
          validator: (String? inputVal) {},
          textEditingController: this._pwd,
        );
      },
    );
  }


  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () => print('Forgot Password Pressed'),
          child: Text(
            'Şifreni mi Unuttun ?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget buildRememberCb() {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.orange,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value!;
                  });
                }),
          ),
          Text(
            'Beni Hatırla',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn(BuildContext context, String buttonName) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          primary: Colors.white,
        ),
        child: Text(
          buttonName,
          style: TextStyle(
            color: Color(0XFFf0952e),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          // Hide keyboard
          SystemChannels.textInput.invokeMethod('TextInput.hide');

          if (mounted) {
            setState(() {
              this._isLoading = true;
            });
          }
          final String email = this._email.text ?? '';
          final String password = this._pwd.text ?? '';

          if (email.isNotEmpty && password.isNotEmpty) {
            final EmailSignInResults emailSignInResults =
            await _emailAndPasswordAuth.signInWithEmailAndPassword(
                email: email, pwd: password);
            String msg = "";
            if (emailSignInResults == EmailSignInResults.SignInCompleted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
                    (route) => false,
              );
            } else if (emailSignInResults == EmailSignInResults.EmailNotVerified) {
              msg = "Email adresiniz doğrulanmamış.\n Lütfen posta kutunuzu kontrol edin";
            } else if (emailSignInResults == EmailSignInResults.EmailOrPasswordInvalid) {
              msg = "Email ya da şifre hatalı";
            } else {
              msg = "Giriş yapılamadı";
            }
            if (msg.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Email and password are required.')));
          }

          if (mounted) {
            setState(() {
              this._isLoading = false;
            });
          }
        },
      ),
    );
  }


  Widget switchToSignUp() =>
      switchAnotherAuthScreen(context, 'Henüz bir hesabın yok mu ?');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: LoadingOverlay(
        isLoading: this._isLoading,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
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
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 80),
                    child: Column(
                      key: this._loginKey,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Gather Other People',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'G.O.P.  sosyalleştirir.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 50),
                        buildEmail(),
                        SizedBox(height: 20),
                        buildPassword(),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            buildForgotPassBtn(),
                            SizedBox(width: 70),
                            buildRememberCb(),
                          ],
                        ),
                        buildLoginBtn(context, "Giriş"),
                        switchToSignUp(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}


Future<String?> get savedEmail async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}

Future<String?> get savedPassword async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('password');
}

