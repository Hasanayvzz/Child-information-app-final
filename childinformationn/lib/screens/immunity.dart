import 'package:flutter/material.dart';

class Immunity extends StatefulWidget {
  @override
  _ImmunityState createState() => _ImmunityState();
}

class _ImmunityState extends State<Immunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bağışıklık sistemi nedir ve nasıl güçlendirilir ?",
            style: TextStyle(fontSize: 14.0)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Bağışıklık sistemi, bir canlıdaki hastalık ve virüslere karşı koruma yapan, zararlı hücreleri tanıyan vücudun koruma sistemidir. '
                    'Bağışıklık sistemi eğer güçlü olursa virüslerin sebep olduğu hastalıklar gibi pek çok hastalığa karşı bizi korumaktadır. '
                    'Bağışıklık sistemini güçlendirmedeki ilk ve en önemli etmen sağlıklı bir yaşam şeklini benimsemektir. Beslenme şekli de bağışıklık sisteminin '
                    'güçlü tutulması için çok önemli bir yere sahiptir. Bağışıklığınızı güçlendirmek için suyu asla ihmal etmeyin, sebze ve meyve yeme alışkanlığı edinin,'
                    ' yoğurt ve kefir tüketin, haftada 2 kez balık tüketin ve biliyorum çok seviyorsunuz ama şeker tüketiminizi azaltın çocuklar. Bunlarla beraber '
                    'bağışıklığı güçlendirmemiz için uyku düzenimize dikkat etmemiz gerekiyor düzenli uyku hepimiz için çok iyi olacaktır.'),
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
            //mainAxisAlignment: MainAxisAlignment,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset("assets/images/immunity.png"),
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
