// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, avoid_print

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plotem/models/absence_thisday.dart';
import 'package:plotem/services/repo_absence.dart';
import 'package:plotem/ui/pages/_absence_page.dart';
import 'package:plotem/ui/pages/_salary_page.dart';
import 'package:plotem/ui/pages/_workleave_page.dart';
import 'package:plotem/utils/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AbsenceThisDay> listabsence = [];
  AbsenceRepository absenceRepository = AbsenceRepository();

  getData() async {
    listabsence = await absenceRepository.getAbsenceThisDay();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMd().format(DateTime.now()),
                    style: TextStyle(
                      color: disabledColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Hi,",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        myUsername,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const CircleAvatar(
                maxRadius: 30,
                backgroundImage: AssetImage(
                  "./lib/assets/ifal.JPG",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Statistics Performance",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: AspectRatio(
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
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: const Text(
            "Actions",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 7 / 6,
            shrinkWrap: true,
            children: [
              MyActionWidget(
                title: "Performance",
                text: "88",
                detail: "all days",
                icon: Icons.trending_up,
                color: frontColor,
                theWidget: () {},
                plusicon: false,
                thecolor: mysecondaryColor,
              ),
              MyActionWidget(
                title: "Absence",
                text: listabsence.isEmpty ? "undone" : "done",
                detail: DateFormat.yMMMd().format(DateTime.now()),
                icon: Icons.holiday_village,
                color: frontColor,
                theWidget: AbsencePage(),
                plusicon: true,
                thecolor: listabsence.isEmpty ? Colors.red : mysecondaryColor,
              ),
              MyActionWidget(
                title: "work leave",
                text: "waiting",
                detail: "all days",
                icon: Icons.holiday_village,
                color: frontColor,
                theWidget: WorkLeavePage(),
                plusicon: true,
                thecolor: Colors.orange,
              ),
              MyActionWidget(
                title: "Salary",
                text: "paid",
                detail: "jun 2024 (IDR)",
                icon: Icons.money,
                color: frontColor,
                theWidget: SalaryPage(),
                plusicon: true,
                thecolor: mysecondaryColor,
              ),
            ],
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

class MyActionWidget extends StatelessWidget {
  String title;
  String text;
  String detail;
  final icon;
  final color;
  final theWidget;
  bool plusicon;
  Color thecolor;
  MyActionWidget({
    super.key,
    required this.title,
    required this.text,
    required this.detail,
    required this.icon,
    required this.color,
    required this.theWidget,
    required this.plusicon,
    required this.thecolor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!plusicon) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 300,
                decoration: BoxDecoration(
                  color: bgColor,
                ),
                child: Stack(
                  children: [
                    Icon(
                      icon,
                      color: Colors.white.withOpacity(.02),
                      size: 500,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              width: 60,
                              child: Divider(
                                thickness: 3,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                text,
                                style: TextStyle(
                                  fontSize: 40,
                                  color: thecolor,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => theWidget),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: glassColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: glassBorderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.event_available,
                  color: frontColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(title),
                const Spacer(),
                plusicon
                    ? Text(
                        "+",
                        style: TextStyle(
                          color: frontColor,
                          fontSize: 18,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            const Spacer(),
            Text(
              text,
              style: TextStyle(
                fontSize: 30,
                color: thecolor,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: disabledColor,
                  size: 12,
                ),
                const SizedBox(width: 5),
                Text(
                  detail,
                  style: TextStyle(
                    fontSize: 12,
                    color: disabledColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
