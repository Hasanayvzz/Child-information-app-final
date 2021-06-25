import 'package:childinformationn/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:childinformationn/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  AuthService _authService = AuthService();
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 100.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Çocuk Bilgilendirme Sistemine Hoşgeldiniz",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                  Container(
                    width: 10,
                    child: Divider(
                      height: 15,
                      color: Colors.brown,
                    ),
                  ),
                  TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "E-Mail",
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "E-Mail giriniz.";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (pass) {
                        email = pass;
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key_rounded),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Şifre",
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Şifrenizi giriniz.";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (pass) {
                        password = pass;
                      }),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contex) => Register()));
                        },
                        child: Text(
                          'Buraya tıklayarak üye olabilirziniz',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              fontStyle: FontStyle.italic),
                        )),
                  ),
                  loginButton(),
                  buildImage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() => ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black54, onPrimary: Colors.white),
      child: Text("Giriş Yap"),
      onPressed: () async {
        try {
          if (_key.currentState.validate()) {
            _key.currentState.save();
          }
          await _authService
              .signIn(_emailController.text, _passwordController.text)
              .then((value) {
            Fluttertoast.showToast(
                msg: "Giriş Yapıldı",
                timeInSecForIosWeb: 2,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[600],
                textColor: Colors.white,
                fontSize: 14);
            return Navigator.pushReplacementNamed(context, "/Home");
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == " Invalid-email") {
            Fluttertoast.showToast(
                msg: "E-Mail geçersiz üye olmadıysanız üye olabilirsiniz",
                timeInSecForIosWeb: 2,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[600],
                textColor: Colors.white,
                fontSize: 14);
          }
          if (e.code == "user-not-found") {
            Fluttertoast.showToast(
                msg: "Kullanıcı bulanamadı, lütfen üye olunuz.",
                timeInSecForIosWeb: 2,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[600],
                textColor: Colors.white,
                fontSize: 14);
          } else if (e.code == 'wrong-password') {
            Fluttertoast.showToast(
                msg: "Şifre Yanlış",
                timeInSecForIosWeb: 2,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey[600],
                textColor: Colors.white,
                fontSize: 14);
          }
        }
      });
  Widget buildImage() {
    return Column(
      children: <Widget>[
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset("assets/images/login.png"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
