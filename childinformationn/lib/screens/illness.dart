import 'package:flutter/material.dart';

class Illness extends StatefulWidget {
  @override
  _IllnessState createState() => _IllnessState();
}

class _IllnessState extends State<Illness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Korona Virüse yakalanırsak neler yapmalıyız ?",
            style: TextStyle(fontSize: 14.0)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Öncellikle korkmayın ve telaşa kapılmayın çocuklar, günümüz hastalığı olan korona virüs hepimize bulaşabilir. Korona virüse yakalanılması halinde testiniz pozitif '
                    'çıktıysa bile doktorunuz sizin evde kendinizi izole etmenizi ve tedavi etmenizi söyleyebilir. Bu durum günümüz şartlarında olan normal bir süreçtir lakin evde tedavi olurken'
                    ' nefes darlığı göğüste kalıcı ağrı veya baskı, mavimsi dudaklar veya yüz gibi belirtileri hissediyorsanız hemen tıbbi yardım istemelisiniz. Bunların dışında '
                    'evde tedavide yapılması gereken birtakım işlemler var. Hasta olan sizseniz evde mümkün olduğunca ailenizden uzakta bir odada bekleyin. Kişisel eşyalarınızı asla paylaşmamalısınız.'
                    ' Hasta yanında olmanız gereken durumlarda ise hem kendiniz hemde hasta kişinin maske kullanması gerekir. Bu dönemde sevdikleriniz siz iyileşene kadar sizden uzak duracak bu sizin ve onların '
                    'sağlığı için oldukça önemlidir kendinizi asla yalnız hissetmeyin çok kısa sürede iyileşip tekrar aralarına döneceksinizdir. Hastalık döneminde çok fazla sıvı tüketin '
                    'uyku düzeninize dikkat edin tüm bu süreç sonunda ise birçok insanın da yaşadığı gibi bir kaç gün hastalık belirtilerini yaşadıktan sonra 1 hafta içerisinde iyileşeceksiniz.'),
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
                      Image.asset("assets/images/illness.png"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
