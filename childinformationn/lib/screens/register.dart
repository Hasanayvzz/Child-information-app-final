import 'package:childinformationn/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:childinformationn/screens/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  AuthService _authService = AuthService();
  String name, email, password, passwordAgain;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 100.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      transformAlignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: 100,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Kullanıcı Adı",
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Kullanıcı Adınızı Giriniz";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (pass) {
                        name = pass;
                      }),
                  SizedBox(
                    height: 10.0,
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
                          return "Email Adresinizi Giriniz";
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
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key_rounded),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Parola",
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Parolanızı giriniz.";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (pass) {
                        password = pass;
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      controller: _passwordAgainController,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key_rounded),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Parola Tekrar",
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Parolanızı Tekrar Giriniz";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (pass) {
                        passwordAgain = pass;
                      }),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        try{
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }
                          await _authService
                              .createPerson(
                            _nameController.text,
                            _emailController.text,
                            _passwordController.text,
                          )
                              .then((value) {
                            Fluttertoast.showToast(
                                msg: "Kayıt olundu",
                                timeInSecForIosWeb: 2,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey[600],
                                textColor: Colors.white,
                                fontSize: 14);
                            return Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()));
                          });

                        }on FirebaseAuthException catch(e){
                          if(e.code =="weak-password"){
                            Fluttertoast.showToast(
                                msg: "Şifreniz 6 ve üzeri karakterden oluşmalıdır",
                                timeInSecForIosWeb: 2,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey[600],
                                textColor: Colors.white,
                                fontSize: 14);
                          }
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              "Kayıt Ol",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
