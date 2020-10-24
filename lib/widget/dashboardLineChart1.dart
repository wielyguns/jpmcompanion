import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';

class LineChartSample5 extends StatefulWidget {
  final allSpots;

  const LineChartSample5({Key key, this.allSpots}) : super(key: key);
  @override
  _LineChartSample5State createState() => _LineChartSample5State();
}

class _LineChartSample5State extends State<LineChartSample5> {
  final List<int> showIndexes = const [1, 3, 5];
  double touchedValue;

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
          showingIndicators: showIndexes,
          spots: widget.allSpots,
          isCurved: true,
          barWidth: 1,
          shadow: const Shadow(
            blurRadius: 1,
            color: Colors.black,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: [
              purpleChart.withOpacity(0.4),
            ],
          ),
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              if (index % 2 == 0) {
                return FlDotCirclePainter(
                  radius: 8,
                  color: purpleChart,
                  strokeWidth: 3,
                  strokeColor: Colors.white,
                );
              } else {
                return FlDotCirclePainter(
                  radius: 8,
                  color: purpleLightTheme,
                  strokeWidth: 3,
                  strokeColor: Colors.white,
                );
              }
            },
            checkToShowDot: (spot, barData) {
              return spot.x != 0 && spot.x != 6;
            },
          ),
          colors: [
            purpleChart,
          ],
          colorStops: [
            0.1,
            0.4,
            0.9
          ]),
    ];

    final LineChartBarData tooltipsOnBar = lineBarsData[0];

    return SizedBox(
      width: 300,
      height: 140,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.blueAccent,
              getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                return touchedBarSpots.map((barSpot) {
                  final flSpot = barSpot;
                  if (flSpot.x == 0 || flSpot.x == 6) {
                    return null;
                  }

                  return LineTooltipItem(
                    '${oCcy.format(flSpot.y)}',
                    const TextStyle(color: Colors.white),
                  );
                }).toList();
              },
            ),
            touchCallback: (LineTouchResponse lineTouch) {
              if (lineTouch.lineBarSpots.length == 1 &&
                  lineTouch.touchInput is! FlLongPressEnd &&
                  lineTouch.touchInput is! FlPanEnd) {
                final value = lineTouch.lineBarSpots[0].x;

                if (value == 0 || value == 6) {
                  setState(() {
                    touchedValue = -1;
                  });
                  return null;
                }

                setState(() {
                  touchedValue = value;
                });
              } else {
                setState(() {
                  touchedValue = -1;
                });
              }
            },
            getTouchedSpotIndicator:
                (LineChartBarData barData, List<int> spotIndexes) {
              return spotIndexes.map((index) {
                return TouchedSpotIndicatorData(
                  FlLine(
                    color: purpleChart.withOpacity(1),
                  ),
                  FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) =>
                        FlDotCirclePainter(
                      radius: 8,
                      color: lerpGradient(
                          barData.colors, barData.colorStops, percent / 100),
                      strokeWidth: 2,
                      strokeColor: Colors.black,
                    ),
                  ),
                );
              }).toList();
            },
          ),
          lineBarsData: lineBarsData,
          minY: 0,
          axisTitleData: FlAxisTitleData(show: true),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(
              showTitles: false,
            ),
            bottomTitles: SideTitles(
              showTitles: false,
            ),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(
            show: false,
          ),
        ),
      ),
    );
  }
}

/// Lerps between a [LinearGradient] colors, based on [t]
Color lerpGradient(List<Color> colors, List<double> stops, double t) {
  if (stops == null || stops.length != colors.length) {
    stops = [];

    /// provided gradientColorStops is invalid and we calculate it here
    colors.asMap().forEach((index, color) {
      final percent = 1.0 / colors.length;
      stops.add(percent * index);
    });
  }

  for (var s = 0; s < stops.length - 1; s++) {
    final leftStop = stops[s], rightStop = stops[s + 1];
    final leftColor = colors[s], rightColor = colors[s + 1];
    if (t <= leftStop) {
      return leftColor;
    } else if (t < rightStop) {
      final sectionT = (t - leftStop) / (rightStop - leftStop);
      return Color.lerp(leftColor, rightColor, sectionT);
    }
  }
  return colors.last;
}
