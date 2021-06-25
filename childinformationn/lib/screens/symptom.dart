import 'package:flutter/material.dart';

class Symptom extends StatefulWidget {
  @override
  _Symptom createState() => _Symptom();
}

class _Symptom extends State<Symptom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Korona Virüs hastalığı belirtileri nelerdir ?",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Korona Virüse yakalanan kişiler ortalama 5-6 gün içerisinde belirtileri göstermeye başlar bununla birlikte bu süre 14 günü bulabilir çocuklar.'
                    ' En yaygın olarak görülen belirtiler ateş, kuru öksürük, yorgunluktur. Bazı belirtiler ise daha nadiren gözükür bunlar '
                    'ağrı ve sızı duyma, boğaz ağrısı, ishal, baş ağrısı, tat alma ve koku duyusunun kaybıdır. Bazı belirtiler ise ciddidir bunlar solunum güçlüğü, göğüs ağrısı '
                    'veya göğüste baskı, konuşma veya hareket kaybıdır. Bir kişi ciddi semptom gösteriyor ise acilen tıbbi yardım alması gerekir. Hafif belirtiler gösteren insanlar '
                    'tedavi sürecini evde geçirmelidir.'),
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
                      Image.asset("assets/images/symptom.png"),
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
