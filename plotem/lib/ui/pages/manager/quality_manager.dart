import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:plotem/models/work_assessment_show.dart';
import 'package:plotem/services/repo_workassessment.dart';
import 'package:plotem/ui/pages/manager/qualityadd_manager.dart';
import 'package:plotem/ui/widgets/myquality.dart';
import 'package:plotem/utils/const.dart';

class QualityManager extends StatefulWidget {
  const QualityManager({super.key});

  @override
  State<QualityManager> createState() => _QualityPageState();
}

class _QualityPageState extends State<QualityManager> {
  List<WorkAssessmentShow> listUsers = [];
  WorkAssessmentRepository warepository = WorkAssessmentRepository();

  getData() async {
    listUsers = await warepository.getMyEmployeeData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Employee Quality",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => QualityAddManager()));
                    // getData(); // Refresh data after modal is closed
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 4 / 3,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  minY: 0,
                  maxX: 30,
                  maxY: 10,
                  gridData: FlGridData(
                    drawHorizontalLine: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: glassBorderColor,
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: glassBorderColor,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(width: 1, color: glassBorderColor),
                  ),
                  titlesData: const FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: [
                        const FlSpot(0, 3),
                        const FlSpot(1, 4),
                        const FlSpot(3, 7),
                        const FlSpot(4, 3),
                        const FlSpot(15, 8),
                        const FlSpot(25, 7),
                        const FlSpot(30, 7),
                      ],
                      gradient: LinearGradient(colors: gradientColors),
                      barWidth: 5,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: gradientColors
                              .map((color) => color.withOpacity(0.4))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Recent",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 350,
              child: ListView.builder(
                itemCount: listUsers.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      MyQualityWidget(
                        nama: listUsers[index].nama,
                        created_at: listUsers[index].created_at,
                        performa: listUsers[index].total,
                        url_profile: listUsers[index].url_profile,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(color: dividerColor),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
