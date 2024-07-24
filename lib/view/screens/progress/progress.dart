import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  int? groupValue = 0;
  final List<String> subjects = ["Physics", "Chemistry", "Biology"];
  final List<Color> color = [primaryColor, secondaryColor, Colors.green];

  final List<ChartData> chartData = [
    ChartData('Physics', 25, primaryColor),
    ChartData('Chemistry', 38, secondaryColor),
    ChartData('Biology', 34, Colors.green),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: kWhite,
        title: Text(
          "Progress",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(fontWeight: FontWeight.bold, color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: AppSizes.p16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
              alignment: Alignment.center,
              child: CupertinoSlidingSegmentedControl<int>(
                backgroundColor: lightGrey.withOpacity(0.2),
                thumbColor: CupertinoColors.white,
                padding: const EdgeInsets.all(2),
                groupValue: groupValue,
                children: {
                  0: buildSegment("24 Hours"),
                  1: buildSegment("7 Days"),
                  3: buildSegment("Month"),
                },
                onValueChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
            ),
            const SizedBox(height: AppSizes.p16),
            ...List.generate(
              3,
              (index) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.p16,
                  vertical: AppSizes.p16,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: AppSizes.p16,
                  vertical: AppSizes.p8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: color[index],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/physics.png",
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        subjects[index],
                        style: AppThemes.lightTheme.textTheme.bodySmall
                            ?.copyWith(
                                fontWeight: FontWeight.bold, color: kWhite),
                      ),
                    ),
                    Text(
                      "00Mins",
                      style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold, color: kWhite),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: SfCircularChart(
                series: <CircularSeries>[
                  // Renders radial bar chart

                  RadialBarSeries<ChartData, String>(
                    useSeriesColor: true,
                    trackOpacity: 0.3,
                    cornerStyle: CornerStyle.bothCurve,
                    dataSource: chartData,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSegment(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.p28,
        vertical: AppSizes.p10,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
