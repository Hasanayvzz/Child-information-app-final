import 'package:flutter/material.dart';

class Virus extends StatefulWidget {
  @override
  _VirusState createState() => _VirusState();
}

class _VirusState extends State<Virus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Korona Virüs yapısı ve özellikleri nedir? ",
          style: TextStyle(fontSize: 17.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Virüsler protein ya da karmaşık yapıdan oluşan bir muhafaza içinde paketlenmiş DNA veya RNA ya sahip çok küçük ajanlardır. '
                    'Çıplak gözle görülemezler cansız ortamlarda yaşam belirtileri göstermezler fakat canlı bir organizmaya girip sayılarını arttırmaya '
                    'başlarlar. Eğer yeteri kadar çoğalabilirlerse canlı organizmanın hücrelerinde tahribata yol açarlar. Korona Virüslerin'
                    ' en rahat ve kolay çoğalabildikleri yer solunum sistemlerimiz olduğundan dolayı canlılarda en belirgin belirti solunum zorluğudur.'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        onPrimary: Colors.black,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset("assets/images/virus.png"),
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
