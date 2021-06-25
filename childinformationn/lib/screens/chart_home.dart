import 'package:flutter/material.dart';
import 'package:childinformationn/interfaces/chart_page.dart';

class ChartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "2021 yılı Korona Virüs vaka grafiği",
        style: TextStyle(fontSize: 18),
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          children: [
            LineChartPage(),
          ],
        ),
      ),
    );
  }
}
