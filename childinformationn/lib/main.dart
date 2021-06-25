import 'package:childinformationn/services/auth.dart';
import 'package:childinformationn/models/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:childinformationn/screens/hakkinda.dart';
import 'package:childinformationn/screens/login_page.dart';
import 'package:childinformationn/models/patient.dart';
import 'package:childinformationn/screens/patient_add.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/Home": (context) => HomeScreen(),
      },
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  AuthService _authService = AuthService();
  List<Patient> patients = [
    Patient.WithId(1, "Hasan", "Ayvaz", 40),
    Patient.WithId(2, "Mert", "Kaplan", 38),
    Patient.WithId(3, "Aylin", "Yücedağ", 37),
  ];
  Patient selectedPatient = Patient.WithId(0, "Hiç kimse", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Çocuk Bilgilendirme Sistemi"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
        drawer: MyDrawer(),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text("Kişiyi silmek için yana kaydırabilirsiniz",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontSize: 15.0))),
        Expanded(
          child: ListView.builder(
              itemCount: patients.length,
              itemBuilder: (BuildContext context, index) {
                Patient patient = patients[index];

                return Dismissible(
                  key: Key(patient.firstName),
                  onDismissed: (direction) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${patient.firstName} silindi'),
                        action: SnackBarAction(
                          label: "Geri Al",
                          onPressed: () {
                            setState(() {
                              patients.add(patient);
                            });
                          },
                        ),
                      ),
                    );
                    setState(() {
                      patients.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text(patients[index].firstName +
                        " " +
                        patients[index].lastName),
                    subtitle: Text("Ateşi : " +
                        patients[index].grade.toString() +
                        "[" +
                        patients[index].getStatus +
                        "]"),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://thesector.com.au/wp-content/uploads/2019/05/sandy-millar-750251-unsplash-1800x1000.jpg"),
                    ),
                    trailing: buildStatusIcon(patients[index].grade),
                    onTap: () {
                      setState(() {
                        this.selectedPatient = patients[index];
                      });
                      this.selectedPatient = patients[index];
                    },
                  ),
                );
              }),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black54, onPrimary: Colors.white, elevation: 5),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Hakkinda()));
            },
            child: Text("Hakkında")),
        Text("Seçili Kişi : " + selectedPatient.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                child: Text("Yeni kişi ekle "),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.black,
                    elevation: 5),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientAdd(patients)),
                  ).then((value) => setState(() {}));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                child: Text("Uygulamadan Çıkış"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.black,
                    elevation: 5),
                onPressed: () {
                  _showDialog();
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(double grade) {
    if (grade < 38) {
      return Icon(Icons.done);
    } else if (grade >= 38 && grade < 39) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }

  _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text("Uygulamadan çıkış yapmak istediğinize emin misiniz ?"),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: MaterialButton(
                  child: Text("Evet"),
                  shape: StadiumBorder(),
                  minWidth: 100,
                  color: Colors.black45,
                  onPressed: () {
                    _authService.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
                  },
                ),
              ),
              MaterialButton(
                child: Text("Hayır"),
                shape: StadiumBorder(),
                minWidth: 100,
                color: Colors.black45,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
