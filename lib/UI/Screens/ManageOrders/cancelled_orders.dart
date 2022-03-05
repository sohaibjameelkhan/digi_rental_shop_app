// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/Colors.dart';
import '../../../Utils/res.dart';


class CancelledOrders extends StatelessWidget {
  const CancelledOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyAppColors.whitecolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)),
                          elevation: 6,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      child: SvgPicture.asset(
                                          Res.invitefriendbanner),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text("\$250",
                                            style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                                color: MyAppColors.blackcolor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18)),
                                        Text("order description will be here ",
                                            style: GoogleFonts.roboto(
                                              // fontFamily: 'Gilroy',
                                                color: MyAppColors.blackcolor
                                                    .withOpacity(0.9),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(19)),
                                            elevation: 3,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(9.0),
                                              child: SvgPicture.asset(
                                                  Res.personicon),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 6),
                                          child: Text("Sohaib ",
                                              style: GoogleFonts.roboto(
                                                // fontFamily: 'Gilroy',
                                                  color: MyAppColors.blackcolor
                                                      .withOpacity(0.9),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15)),
                                        ),
                                      ],
                                    ),
                                    Text("CANCELLED ",
                                        style: GoogleFonts.roboto(
                                          // fontFamily: 'Gilroy',
                                            color: MyAppColors.appColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Text("Feb 3,2022",
                                        style: GoogleFonts.roboto(
                                          // fontFamily: 'Gilroy',
                                            color: MyAppColors.blackcolor
                                                .withOpacity(0.9),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}
