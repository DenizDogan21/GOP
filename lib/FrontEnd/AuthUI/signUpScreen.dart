import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gop/Backend/firebase/Auth/sign_up_auth.dart';
import 'package:gop/FrontEnd/AuthUI/common_auth_methods.dart';
import 'package:gop/FrontEnd/AuthUI/loginScreen.dart';
import 'package:gop/Global_Uses/enum_gop.dart';
import 'package:gop/Global_Uses/reg_exp.dart';
import 'package:loading_overlay/loading_overlay.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isRememberMe = false;
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pwd = TextEditingController();

  final EmailAndPasswordAuth _EmailandPasswordAuth = EmailAndPasswordAuth();

  /* Widget buildName() =>
      commonTextFormField(hintText: "Ad", icon: Icons.person, tf: false);

  Widget buildSurname() =>
      commonTextFormField(hintText: "Soyad", icon: Icons.person, tf: false);*/

  Widget buildUsername() => commonTextFormField(
      hintText: "Kullanıcı Adı",
      icon: Icons.accessibility_new,
      tf: false,
      validator: (String? inputVal) {
        if (inputVal!.length > 18)
          return "Kullanıcı adı 18 karakterden uzun olamaz";
        return null;
      },
      textEditingController: this._username);

  Widget buildEmail() => commonTextFormField(
      hintText: "Üniversite maili",
      icon: Icons.email,
      tf: false,
      validator: (inputVal) {
        if (!emailRegex.hasMatch(inputVal.toString()))
          return "Bu bir üniversite adresi değil";
        return null;
      },
      textEditingController: this._email);

  Widget buildPassword() => commonTextFormField(
      hintText: "Şifre",
      icon: Icons.lock,
      tf: true,
      validator: (String? inputVal) {
        if (inputVal!.length < 6)
          return "Şifre en az 6 karakterden oluşmalıdır";
        return null;
      },
      textEditingController: this._pwd);

  Widget buildConditionsOfUse() {
    return Container(
      height: 20,
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
            'Kullanım Koşullarını Okudum, Onaylıyorum',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget buildSignUpBtn(BuildContext context, String buttonName) {
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
          // if (this._signUpKey.currentState!.validate()) {
          print("Validated");
          //burayabak
          if (mounted) {
            setState(() {
              this._isLoading = true;
            });
          }

          SystemChannels.textInput.invokeMethod('TextInput.hide');
          final EmailSignUpResults response = await this
              ._EmailandPasswordAuth
              .signUpAuth(email: this._email.text, pwd: this._pwd.text);
          if (response == EmailSignUpResults.SignUpCompleted) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => LoginScreen()));
          } else {
            final String msg =
                response == EmailSignUpResults.EmailAlreadyPresent
                    ? 'Bu email zaten kullanılmakta'
                    : 'Kaydolma başarısız';
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(msg),
            ));
          }
          /* }  else {
            print("not validated");
          } burayabak */
          if (mounted) {
            setState(() {
              this._isLoading = false;
            });
          }
        },
      ),
    );
  }

  Widget switchToLogin() =>
      switchAnotherAuthScreen(context, 'Zaten bir hesabın var mı ?');

  bool _isLoading = false;

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
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 70),
                  child: Column(
                    key: this._signUpKey,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'G. O. P.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      /*buildName(),
                      SizedBox(height: 20),
                      buildSurname(),
                      SizedBox(height: 20),*/
                      buildUsername(),
                      SizedBox(height: 20),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      SizedBox(height: 20),
                      buildConditionsOfUse(),
                      buildSignUpBtn(context, "Kaydol"),
                      switchToLogin(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    )));
  }
}
