import 'package:flutter/material.dart';

class Subject extends StatefulWidget {
  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uygulamanın amacı ve hedefleri"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Günümüzün bir parçası olan Korona Virüsün hakkında birtakım bilgileri küçük arkadaşlarımıza anlatıp,'
                    ' ailesi yanında olmayan küçük arkadaşlarımızı hedef alıp ateşini ölçüğünde ateşinin durumuna göre'
                    ' sağlığı hakkında minik bilgiler veren bir uygulamadır.'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black54,
                        onPrimary: Colors.white,
                        elevation: 5),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Home');
                    },
                    child: Text('Anasayfaya Dön'),
                  ),
                ),
                buildImage()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return Column(
      children: <Widget>[
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/target.png"),
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
