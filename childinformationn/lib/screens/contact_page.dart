import 'package:childinformationn/models/animation.dart';
import 'package:flutter/material.dart';
import 'package:childinformationn/screens/contact_add_page.dart';
import 'package:childinformationn/models/contact.dart';
import 'package:childinformationn/database/db_helper.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> contacts;
  DbHelper _dbHelper;
  @override
  void initState() {
    contacts = Contact.contacts;
    _dbHelper = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Contact.contacts
        .sort((Contact a, Contact b) => a.name[0].compareTo(b.name[0]));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yakınlarınıza ait telefon numaraları',
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddContactPage()));
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _dbHelper
            .getContacts(),
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapShot) {
          if (!snapShot.hasData) return CircularProgressIndicator();
          if (snapShot.data.isEmpty)
            return Center(
                child: YaziyiHareketlendir());
          return ListView.builder(
              itemCount: snapShot
                  .data.length,
              itemBuilder: (BuildContext context, int index) {
                Contact contact = snapShot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) async {
                    _dbHelper.removeContact(contact.id);

                    setState(() {});

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${contact.name} Silindi"),
                      action: SnackBarAction(
                        label: "Geri Al",
                        onPressed: () async {
                          _dbHelper.insertContact(contact);
                          setState(() {});
                        },
                      ),
                    ));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://play-lh.googleusercontent.com/D-haUsSx771Pt4brCyFEJUNKZaC8NUsD2bMB-ZL_yE2LnYdmt3YbgfZwDDM9B-wBHw'),
                    ),
                    title: Text(contact.name),
                    subtitle: Text(contact.phoneNumber),
                  ),
                );
              });
        },
      ),
    );
  }
}
