// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:badges/badges.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Colors.dart';
import '../../Utils/res.dart';
import 'feedback.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory(
      {Key? key,
      menuScreenContext,
      bool? hideStatus,
      Null Function()? onScreenHideButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Card(
                        //  color: MyAppColors.appColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 19,
                            color: MyAppColors.appColor,
                          ),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text("Payment History",
                      style: GoogleFonts.roboto(
                          // fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          fontSize: 19)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: MyAppColors.bgtextfieldcolor,
                    borderRadius: BorderRadius.circular(13)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 25, top: 15),
                      hintText: "Search here..",
                      hintStyle: GoogleFonts.roboto(
                          // fontFamily: 'Gilroy',
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: SvgPicture.asset(
                          Res.searchicon,
                          height: 2,
                          width: 2,
                        ),
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListView.builder(
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                itemBuilder: (_, i) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(Res.personicon),
                                    ),
                                    backgroundColor: MyAppColors.Lightgrey,
                                    radius: 28,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Pavel Woods",
                                          style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      InkWell(
                                        child: Text("Give Feedback",
                                            style: GoogleFonts.roboto(
                                                // fontFamily: 'Gilroy',
                                                color: MyAppColors.appColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15)),
                                        onTap: () {
                                          Get.to(FeedbackScreen());
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  children: [
                                    Text("\$25.00",
                                        style: GoogleFonts.roboto(
                                            // fontFamily: 'Gilroy',
                                            color: MyAppColors.redcolor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15)),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text("23/05/21",
                                        style: GoogleFonts.roboto(
                                            // fontFamily: 'Gilroy',
                                            color: MyAppColors.Lightgrey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14)),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            height: 3,
                            color: MyAppColors.Lightgrey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      )),
    );
  }
}
