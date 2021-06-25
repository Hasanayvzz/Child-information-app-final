
import 'package:childinformationn/database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:childinformationn/models/contact.dart';

class AddContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: AddContactForm(),
    );
  }
}

class AddContactForm extends StatefulWidget {
  @override
  _AddContactFormState createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final _formKey = GlobalKey<FormState>();
  DbHelper _dbHelper;
  @override
  void initState() {
    _dbHelper =DbHelper();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String name;
    String phoneNumber;
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset("assets/images/person.jpg",fit: BoxFit.fill,
            width: double.infinity,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'İsim'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "İsim boş bırakılamaz";
                        }
                      },
                      onSaved: (value) {
                        name = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(hintText: 'Telefon Numarası'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Telefon numarası boş bırakılamaz.";
                        }
                      },
                      onSaved: (value) {
                        phoneNumber = value;
                      },
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black54,
                          onPrimary: Colors.white,
                          elevation: 5),
                      onPressed: () async{
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          var contact =
                          Contact(name: name, phoneNumber: phoneNumber);

                          await _dbHelper.insertContact(contact);

                          var snackBar = ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text("$name Kaydedildi")));
                          snackBar.closed.then((onValue) {
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: Text("Kaydet")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
