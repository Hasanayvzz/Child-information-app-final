import 'package:flutter/material.dart';
import '../models/chart.dart';

class LineChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 20.0, top: 20),
        child: LineChartWidget(),
      ),
    );
  }
}
