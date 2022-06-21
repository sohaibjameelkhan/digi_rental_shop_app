// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../Utils/Colors.dart';
import '../../Utils/res.dart';

class Home extends StatefulWidget {
  const Home(
      {Key? key,
      menuScreenContext,
      bool? hideStatus,
      Null Function()? onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color leftBarColor = Colors.green;

  final Color rightBarColor = Color(0xffF89673);
  final double width = 10;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 0,
          backgroundColor: MyAppColors.whitecolor,
          centerTitle: false,
          title: const Text(
            'Sohaib Jameel',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.png')),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                // height: Get.height * .45,
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    rowTxt(leftTxt: 'Shop level', rightTxt: 'New Shop'),
                    const SizedBox(height: 10),
                    rowTxt(
                        leftTxt: 'Response time',
                        rightTxt: '1 Hour',
                        rightTxtClr: MyAppColors.appColor),
                    SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    ExpansionTile(
                      trailing: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: MyAppColors.whitecolor,
                      ),
                      title: const Text(
                        'Reach Your next level',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 14),
                        rowTxt(
                            leftTxt: 'Selling senority',
                            leftTxtSize: 15,
                            rightTxt: '60 / 60',
                            rightTxtClr: MyAppColors.appColor),
                        SizedBox(
                            width: Get.width * .56,
                            child: const Text(
                              'Complete at least 60 days as a New Seller',
                              style:
                              TextStyle(fontSize: 13, color: Colors.grey),
                            )),
                        const SizedBox(height: 10),
                        const Divider(color: Colors.grey),
                        rowTxt(
                            leftTxt: 'Order',
                            leftTxtSize: 16,
                            rightTxt: '10 / 10',
                            rightTxtClr: MyAppColors.appColor),
                        SizedBox(
                            width: Get.width * .56,
                            child: const Text(
                              'Recievce and complete at least 10 orders (all time)',
                              style:
                              TextStyle(fontSize: 13, color: Colors.grey),
                            )),
                        const SizedBox(height: 5),
                        const Divider(color: Colors.grey),
                        rowTxt(
                            leftTxt: 'Earnings',
                            leftTxtSize: 15,
                            rightTxt: "  \$317 / \$400",
                            rightTxtClr: MyAppColors.appColor),
                        SizedBox(
                            width: Get.width * .56,
                            child: const Text(
                              'Earn at least \$400 from completed orders (all time)',
                              style:
                              TextStyle(fontSize: 13, color: Colors.grey),
                            )),
                        const SizedBox(height: 10),
                        const Divider(color: Colors.grey),
                        rowTxt(
                            leftTxt: 'Days without warnings',
                            leftTxtSize: 15,
                            rightTxt: '30 / 30',
                            rightTxtClr: MyAppColors.appColor),
                        SizedBox(
                            width: Get.width * .56,
                            child: const Text(
                              'Avoid recieving warnings for TOS ciolations over the course of 30',
                              style:
                              TextStyle(fontSize: 13, color: Colors.grey),
                            )),
                        const SizedBox(height: 10),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        children: [
                          Text(
                            'Last 7 days',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 170,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: BarChart(
                          BarChartData(
                            maxY: 35,
                            barTouchData: BarTouchData(
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.grey,
                                  getTooltipItem: (_a, _b, _c, _d) => null,
                                ),
                                touchCallback: (FlTouchEvent event, response) {
                                  if (response == null ||
                                      response.spot == null) {
                                    setState(() {
                                      touchedGroupIndex = -1;
                                      showingBarGroups = List.of(rawBarGroups);
                                    });
                                    return;
                                  }

                                  touchedGroupIndex =
                                      response.spot!.touchedBarGroupIndex;

                                  setState(() {
                                    if (!event.isInterestedForInteractions) {
                                      touchedGroupIndex = -1;
                                      showingBarGroups = List.of(rawBarGroups);
                                      return;
                                    }
                                    showingBarGroups = List.of(rawBarGroups);
                                    if (touchedGroupIndex != -1) {
                                      var sum = 0.0;
                                      for (var rod
                                          in showingBarGroups[touchedGroupIndex]
                                              .barRods) {
                                        sum += rod.y;
                                      }
                                      final avg = sum /
                                          showingBarGroups[touchedGroupIndex]
                                              .barRods
                                              .length;

                                      showingBarGroups[touchedGroupIndex] =
                                          showingBarGroups[touchedGroupIndex]
                                              .copyWith(
                                        barRods:
                                            showingBarGroups[touchedGroupIndex]
                                                .barRods
                                                .map((rod) {
                                          return rod.copyWith(y: avg);
                                        }).toList(),
                                      );
                                    }
                                  });
                                }),
                            titlesData: FlTitlesData(
                              show: true,
                              rightTitles: SideTitles(showTitles: false),
                              topTitles: SideTitles(showTitles: false),
                              bottomTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (context, value) =>
                                    const TextStyle(
                                        color: Colors.white54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                margin: 10,
                                getTitles: (double value) {
                                  switch (value.toInt()) {
                                    case 0:
                                      return 'Mn';

                                    case 1:
                                      return 'Te';
                                    case 2:
                                      return 'Wd';
                                    case 3:
                                      return 'Tu';
                                    case 4:
                                      return 'Fr';
                                    case 5:
                                      return 'St';
                                    case 6:
                                      return 'Sn';
                                    default:
                                      return '';
                                  }
                                },
                              ),
                              leftTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (context, value) =>
                                    const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                margin: 8,
                                reservedSize: 28,
                                interval: 1,
                                getTitles: (value) {
                                  if (value == 0) {
                                    return '1K';
                                  } else if (value == 10) {
                                    return '2K';
                                  } else if (value == 10) {
                                    return '3K';
                                  } else if (value == 10) {
                                    return '4K';
                                  } else if (value == 19) {
                                    return '5K';
                                  } else {
                                    return '';
                                  }
                                },
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: showingBarGroups,
                            gridData: FlGridData(show: false),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Balance',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '500 RS',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Orders',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '25',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Orders',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  'Active',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '25',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Orders',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  'Cancelled',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Products',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  'Avaliable',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '350',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Ratings',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 2,
                    //       child: Container(
                    //         child: circularProgressWithTitle(
                    //             filledPercentText: 97,
                    //             titleText: 'Response \n Rate'),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 2,
                    //       child: circularProgressWithTitle(
                    //           filledPercentText: 75,
                    //           titleText: 'Order \n completion'),
                    //     ),
                    //     Expanded(
                    //       flex: 2,
                    //       child: circularProgressWithTitle(
                    //           filledPercentText: 75,
                    //           titleText: 'On-time \n delivery'),
                    //     ),
                    //     Expanded(
                    //       flex: 2,
                    //       child: circularProgressWithTitle(
                    //           filledPercentText: 75,
                    //           titleText: 'Positive \n Rating'),
                    //     ),
                    //   ],
                    // ),

                  ],
                ),
              ),



            ],
          ),
        ));
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColor],
        width: width,
      ),
      BarChartRodData(
        y: y2,
        colors: [rightBarColor],
        width: width,
      ),
    ]);
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}

Widget columnTxt(
    {required String upperTxt, lowerTxt, Color lowerTxtClr = Colors.black}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        upperTxt,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      const SizedBox(height: 5),
      Text(
        '\$$lowerTxt',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: lowerTxtClr),
      ),
    ],
  );
}

Widget rowTxt(
    {required String leftTxt,
    rightTxt,
    Color rightTxtClr = Colors.white,
    Color leftTxtClr = Colors.white,
    double leftTxtSize = 15}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        leftTxt,
        style: TextStyle(
            fontSize: leftTxtSize,
            color: leftTxtClr,
            fontWeight: FontWeight.w400),
      ),
      Text(
        rightTxt,
        style: TextStyle(
            fontSize: 14, color: rightTxtClr, fontWeight: FontWeight.w600),
      ),
    ],
  );
}

Widget circularProgressWithTitle({required int filledPercentText, titleText}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CircularPercentIndicator(
        radius: 33.0,
        animation: true,
        animationDuration: 1200,
        lineWidth: 3.0,
        percent: (filledPercentText / 100),
        center: Text(
          "$filledPercentText %",
          style: TextStyle(
              color: MyAppColors.whitecolor,
              fontWeight: FontWeight.w500,
              fontSize: 15.0),
        ),
        circularStrokeCap: CircularStrokeCap.butt,
        backgroundColor: Colors.white24,
        progressColor: MyAppColors.appColor,
      ),
      const SizedBox(height: 12),
      SizedBox(
        width: Get.width * .3,
        child: Text(
          titleText,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: MyAppColors.whitecolor,
              fontWeight: FontWeight.w400,
              fontSize: 13.0),
        ),
      ),
    ],
  );
}
