import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTextStyles: (value) => const TextStyle(
                  color: Color(0xff23b6e6),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 0:
                  return 'Kasım';
                case 2:
                  return 'Aralık';
                case 4:
                  return 'Ocak';
                case 6:
                  return 'Şubat';
                case 8:
                  return 'Mart';
                case 10:
                  return 'Nisan';
                case 12:
                  return 'Mayıs';
              }
              return " ";
            }),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff23b6e6),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return "20bin";
              case 4:
                return "40bin";
              case 6:
                return "60bin";
            }
            return '';
          },
          reservedSize: 40,
          margin: 8,
        ),
      );
}
