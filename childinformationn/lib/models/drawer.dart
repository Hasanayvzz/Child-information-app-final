import 'package:childinformationn/screens/applicationsubject.dart';
import 'package:childinformationn/screens/chart_home.dart';
import 'package:childinformationn/screens/contact_page.dart';
import 'package:childinformationn/screens/illness.dart';
import 'package:childinformationn/screens/immunity.dart';
import 'package:childinformationn/screens/news_page.dart';
import 'package:childinformationn/screens/out.dart';
import 'package:childinformationn/screens/profil.dart';
import 'package:childinformationn/screens/school.dart';
import 'package:childinformationn/screens/symptom.dart';
import 'package:childinformationn/screens/virus.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/child.png"),
                )),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text("Anasayfa"),
                trailing: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/Home");
                },
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[400], Colors.grey[800]])),
                child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Profil',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilPage()));
                    }),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[400], Colors.grey[800]])),
                child: ExpansionTile(
                  leading: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    '??ocuklar kendisini Korona Vir??sten nas??l korur?',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                      title: Text(
                        'D????ar??da',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Protection()));
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.grey[400], Colors.grey[800]])),
                      child: ListTile(
                        leading: Icon(Icons.arrow_forward, color: Colors.black),
                        title: Text(
                          'Okulda',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => School()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[400], Colors.grey[800]])),
                child: ListTile(
                  leading: Icon(Icons.arrow_forward, color: Colors.black),
                  title: Text(
                    "Korona Vir??s yap??s?? ve ??zellikleri nedir ?",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Virus()));
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[400], Colors.grey[800]])),
                child: ListTile(
                    leading: Icon(Icons.arrow_forward, color: Colors.black),
                    title: Text(
                      'Korona Vir??s hastal?????? belirtileri nelerdir ?',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Symptom()));
                    }),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[400], Colors.grey[800]])),
                child: ListTile(
                    leading: Icon(Icons.arrow_forward, color: Colors.black),
                    title: Text(
                      'Ba????????kl??k sistemi nedir ve nas??l g????lendirilir ?',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Immunity()));
                    }),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[400], Colors.grey[800]])),
                child: ListTile(
                    leading: Icon(Icons.arrow_forward, color: Colors.black),
                    title: Text(
                      'E??er Korona Vir??se yakalan??rsak neler yapmal??y??z?',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Illness()));
                    }),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[400], Colors.grey[800]])),
                child: ListTile(
                    leading: Icon(Icons.arrow_forward, color: Colors.black),
                    title: Text(
                      'Uygulama amac?? ve hedefleri',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Subject()));
                    }),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[400], Colors.grey[800]])),
                child: ListTile(
                    leading: Icon(Icons.arrow_forward, color: Colors.black),
                    title: Text(
                      'Kay??tl?? Numaralar',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactPage()));
                    }),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[400], Colors.grey[800]])),
                child: ListTile(
                    leading: Icon(Icons.arrow_forward, color: Colors.black),
                    title: Text(
                      'Korona Vir??s Vaka Grafi??i',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChartHome()));
                    }),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[400], Colors.grey[800]])),
                child: ListTile(
                    leading: Icon(Icons.arrow_forward, color: Colors.black),
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'G??ncel Haberler  ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.description,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewsPage()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
