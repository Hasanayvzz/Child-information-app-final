class Contact {
  int id;
  String name;
  String phoneNumber;
  static List<Contact> contacts = [

  ];
  Contact({this.phoneNumber, this.name});

  Map <String,dynamic> toMap(){

    var map =Map<String,dynamic>();
    map["name"] = name;
    map["phone_number"] = phoneNumber;
    return map;


  }
  Contact.fromMap(Map<String, dynamic>map){
    id = map["id"];
    name = map["name"];
    phoneNumber = map["phone_number"];

  }
}