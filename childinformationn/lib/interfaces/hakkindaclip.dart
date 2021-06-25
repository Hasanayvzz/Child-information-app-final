import 'package:flutter/material.dart';

class HakkindaClip extends StatefulWidget {
  @override
  _HakkindaClipState createState() => _HakkindaClipState();
}

class _HakkindaClipState extends State<HakkindaClip> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: BackgrounClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8 * 1.33,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.black45],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
            ),
          ),
        ),
        Align(
          child: Image.asset(
            'assets/images/whoimi.png',
            scale: 4,
          ),
          alignment: Alignment.center,
        ),
        Positioned(
          bottom: 20,
          left: 80,
          child: Column(
            children: <Widget>[
              Text(
                "Hakkında",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ],
          ),
        ),
        BuildButton()
      ],
    );
  }

  Widget BuildButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white, onPrimary: Colors.black),
        child: Text('Ana Sayfa'),
        onPressed: () {
          Navigator.pushNamed(context, '/Home');
        },
      );
}

class BackgrounClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 50.0;
    var path = Path();

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0.0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(
        size.width, 0, size.width - roundnessFactor * 3, roundnessFactor * 2);
    path.lineTo(roundnessFactor, size.height * 0.33 + 10);
    path.quadraticBezierTo(0, size.height * 0.33 + roundnessFactor, 0,
        size.height * 0.33 + roundnessFactor * 2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
