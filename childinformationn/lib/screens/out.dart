import 'package:flutter/material.dart';

class Protection extends StatefulWidget {
  @override
  _ProtectionState createState() => _ProtectionState();
}

class _ProtectionState extends State<Protection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dışarıda Korona Virüsten Nasıl Korunuruz ?",
          style: TextStyle(fontSize: 15.0),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Halka açık yerlerde mutlaka maskenizi takın çocuklar,'
                    ' Eğer ellerinizi yıkayacak biryer bulamazsanız yanınızda el'
                    ' dezenfektanı bulundurun el dezenfektanı ile ellerin üzeri ve parmak '
                    'araları da dahil olmak üzere elin tamamına yedirilmesini sağlayın. Beslenmenize'
                    ' dikkat edin ve bağışıklığınızı güçlendirin. Kalabalık ortamlarda mümkün olduğunca '
                    'yüzeylere dokunmamaya çalışın.'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black87,
                        onPrimary: Colors.white,
                        elevation: 5),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Home');
                    },
                    child: Text('Anasayfaya Dön'),
                  ),
                ),
                BuildImage()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget BuildImage() {
    return Column(
      children: <Widget>[
        IntrinsicHeight(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/images/out.png"),
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
