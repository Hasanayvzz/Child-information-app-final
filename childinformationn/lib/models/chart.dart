import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:childinformationn/models/line_titles.dart';

class LineChartWidget extends StatelessWidget {
  List<Color> gradientColors = [
    const Color(0xc425e6b9),
    const Color(0xFFEAEAEA),
  ];

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
            minX: 0,
            maxX: 13,
            minY: 0,
            maxY: 7,
            titlesData: LineTitles.getTitleData(),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Color(0xff02d39a),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Color(0xff02d39a),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey, width: 1),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 2.5),
                  FlSpot(2, 2.2),
                  FlSpot(4, 1.5),
                  FlSpot(6, 1.6),
                  FlSpot(8, 1.8),
                  FlSpot(10, 4.2),
                  FlSpot(12, 3.3),
                ],
                isCurved: true,
                colors: gradientColors,
                barWidth: 4,
                //dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.5))
                      .toList(),
                ),
              ),
            ]),
      );
}
