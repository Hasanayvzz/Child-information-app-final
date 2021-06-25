import 'package:flutter/material.dart';

class School extends StatefulWidget {
  @override
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Okulda Korona Virüsten Nasıl Korunuruz?",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Virüsler Çocuklar hepimizin bildiği gibi korona virüs şuanki günümüzün bir parçası okulların açılmasıyla beraber sizlerinde okulda'
                        ' almanız gereken bir takım tedbirler var. Oyun oynamak çok keyiflidir. Okulda tenefüslerde tabiki oyunlar oynayacaksınız,'
                        ' hem kendinizi hemde arkadaşlarınızı korumak için mutlaka sosyal mesafenizi koruyunuz ve sosyal mesafeli oyunlar seçiniz. Maskenizi '
                        'takmayı ihmal etmeyiniz ve okuldayken sık sık ellerinizi yıkayınız. Derslerde maskenizi çıkarmayınız ve maskenize dokunmamaya özen gösteriniz, '
                        'maskenizi çıkarmanız veya değiştirmeniz gerektiğinde maskenin lastiklerinden tutarak çıkarınız. Kesinlikle ve kesinlikle başkasının '
                        'maskesini kullanmayınız. '),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
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
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset("assets/images/school.png"),
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
