// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../Utils/Colors.dart';
import '../../Utils/res.dart';

class Home extends StatelessWidget {
  const Home(
      {Key? key,
      menuScreenContext,
      bool? hideStatus,
      Null Function()? onScreenHideButtonPressed})
      : super(key: key);

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
                    const SizedBox(height: 20),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                   //   crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex:2,
                          child: circularProgressWithTitle(
                              filledPercentText: 97,
                              titleText: 'Response \n Rate'),
                        ),
                        Expanded(
                          flex:2,
                          child: circularProgressWithTitle(
                              filledPercentText: 75,
                              titleText: 'Order \n completion'),
                        ),
                        Expanded(
                          flex:2,
                          child: circularProgressWithTitle(
                              filledPercentText: 75,
                              titleText: 'On-time \n delivery'),
                        ),
                        Expanded(
                          flex:2,
                          child: circularProgressWithTitle(
                              filledPercentText: 75,
                              titleText: 'Positive \n Rating'),
                        ),

                      ],
                    ),
                    const SizedBox(height: 15),
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
                        const SizedBox(height: 10),
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
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
                child: rowTxt(
                    leftTxt: 'Earnings',
                    rightTxt: 'Details',
                    leftTxtClr: Colors.black,
                    rightTxtClr: MyAppColors.blackcolor,
                    leftTxtSize: 20),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: .4,
                        blurRadius: 9,
                        offset:
                            const Offset(0, 0), //// changes position of shadow
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: columnTxt(
                                upperTxt: 'Personal balance',
                                lowerTxt: '9.60',
                                lowerTxtClr: MyAppColors.blackcolor),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: columnTxt(
                              upperTxt: 'Average selling price',
                              lowerTxt: '37.60',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: columnTxt(
                              upperTxt: 'Pending clearance',
                              lowerTxt: '35.60',
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: columnTxt(
                              upperTxt: 'Earning in March',
                              lowerTxt: '38.60',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: columnTxt(
                                upperTxt: 'Active orders',
                                lowerTxt: '250.60 (1)',
                                lowerTxtClr: MyAppColors.blackcolor),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: columnTxt(
                              upperTxt: 'Cancel orders',
                              lowerTxt: '0.00 (0)',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40)
            ],
          ),
        ));
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
