
import 'package:flutter/material.dart';
import 'package:childinformationn/models/patient.dart';

class PatientAdd extends StatefulWidget {
  List<Patient> patients;
  PatientAdd(
      this.patients); //parametreyle gelecek olan bir list of student olucak onu direk ata demek
  @override
  State<StatefulWidget> createState() {
    return _PatientAddState();
  }
}

class _PatientAddState extends State<PatientAdd> {
  var formKey = GlobalKey<FormState>();
  Patient patient = Patient("", "", 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Kişi "),
      ),
      body: Container(
          margin: EdgeInsets.all(20.0),

          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildGradeField(),
                  BuildSubmitButton()

                ],
              ),
            ),
          )),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Kişi Adı", hintText: "Hasan"),
      onSaved: (String value) {
        patient.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
      InputDecoration(labelText: " Soyadı", hintText: "Ayvaz"),
      onSaved: (String value) {
        patient.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ateşi", hintText: "36.5-41"),
      onSaved: (String value) {
        patient.grade = double.parse(value);
      },
    );
  }

  Widget BuildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      style: ElevatedButton.styleFrom(
          primary: Colors.black, onPrimary: Colors.white, elevation: 1),
      onPressed: () {
        formKey.currentState.save();
        widget.patients.add(patient);
        Navigator.pop(context);
      },
    );
  }
}
