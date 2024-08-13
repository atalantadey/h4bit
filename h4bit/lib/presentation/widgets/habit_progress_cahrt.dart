import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';

class HabitProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);
    final habits = habitProvider.habits;

    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 7,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  const style = TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  );
                  Widget text;
                  switch (value.toInt()) {
                    case 0:
                      text = const Text('M', style: style);
                      break;
                    case 1:
                      text = const Text('T', style: style);
                      break;
                    case 2:
                      text = const Text('W', style: style);
                      break;
                    case 3:
                      text = const Text('T', style: style);
                      break;
                    case 4:
                      text = const Text('F', style: style);
                      break;
                    case 5:
                      text = const Text('S', style: style);
                      break;
                    case 6:
                      text = const Text('S', style: style);
                      break;
                    default:
                      text = const Text('', style: style);
                      break;
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: text,
                  );
                },
              ),
            ),
            leftTitles:const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(7, (index) {
            int completedHabits =
                habits.where((habit) => habit.completionStatus[index]).length;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: completedHabits.toDouble(),
                  color: Theme.of(context).primaryColor,
                  width: 22,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
