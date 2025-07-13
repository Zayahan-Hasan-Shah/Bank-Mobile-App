import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OverAllIncomingTransactionLineChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const OverAllIncomingTransactionLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final spots = data.asMap().entries.map((entry) {
      final index = entry.key.toDouble();
      final amount = (entry.value['amount'] as num).toDouble();
      return FlSpot(index, amount);
    }).toList();

    return AspectRatio(
      aspectRatio: 1.6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                spots: spots,
                dotData: FlDotData(show: false),
                // spots: Colors.blue.shade300,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.shade100.withOpacity(0.4),
                ),
                barWidth: 3,
              ),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                // tooltipBgColor: Colors.deepPurpleAccent,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((spot) {
                    final index = spot.x.toInt();
                    final amount = spot.y.toStringAsFixed(2);
                    return LineTooltipItem(
                      "\$${amount}",
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList();
                },
              ),
              touchCallback: (event, response) {
                // You can handle touch here if needed
              },
              handleBuiltInTouches: true,
            ),
          ),
        ),
      ),
    );
  }
}
