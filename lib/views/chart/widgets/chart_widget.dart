import 'package:crime_chart_app/models/CrimeModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CrimeDataChart extends StatelessWidget {
  late List<Records> crimeData;

  CrimeDataChart({required this.crimeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 800000, // Adjust this according to your data's range
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipColor: (color) => Colors.white,
                getTooltipItem: (groupData,groupIndex,rod,rodIndex){
                  return BarTooltipItem("${crimeData[groupData.x.toInt()].crimeHead }\n",  TextStyle(color: Colors.black),children:<TextSpan>[
                    TextSpan(
                      text: '${rod.toY.toInt()} cases',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]);
                }
              ),
            ),
            titlesData: const FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
               sideTitles: SideTitles(
                 showTitles: true,
               )
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                )
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: crimeData.asMap().entries.map((entry) {
              int index = entry.key;
              Records crime = entry.value;
              return BarChartGroupData(
                x: index+1,
                barRods: [
                  BarChartRodData(
                    toY: crime.casesReportedDuringTheYear?.toDouble() ?? 0.0,
                    color:Colors.lightBlueAccent
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

