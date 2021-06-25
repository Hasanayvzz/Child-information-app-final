import 'package:flutter/material.dart';

class YaziyiHareketlendir extends StatefulWidget {
  @override
  _YaziyiHareketlendirState createState() => _YaziyiHareketlendirState();
}

class _YaziyiHareketlendirState extends State<YaziyiHareketlendir>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear)
      ..addListener(() => this.setState(() {}));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Kayıtlı numara bulunmamaktadır.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20 + _animation.value * 0.8,
            color: Colors.grey),
      ),
    );
  }
}
