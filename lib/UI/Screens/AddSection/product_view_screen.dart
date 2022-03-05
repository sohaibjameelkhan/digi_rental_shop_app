// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_shop_app/Utils/Colors.dart';

import '../../../Utils/res.dart';
import '../../../Utils/res.dart';
import '../../Widgets/product_delete_confirm.dart';
import 'add_categories.dart';
import 'add_product_screen.dart';
import 'edit_product_screen.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen(
      {Key? key,
      menuScreenContext,
      bool? hideStatus,
      Null Function()? onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyAppColors.appColor,
        onPressed: () {
          Get.to(AddProduct());
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
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
                    width: 20,
                  ),
                  Text("Products For Rent",
                      style: GoogleFonts.roboto(
                          // fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (_, i) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: SvgPicture.asset(
                                            Res.invitefriendbanner),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Dslr",
                                              style: GoogleFonts.roboto(
                                                  // fontFamily: 'Gilroy',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20)),
                                          SizedBox(
                                            height: 3,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.to(EditProductScreen());
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: MyAppColors.appColor,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return ProductDeleteConfirmDialog(
                                                      //widget.contactId

                                                      );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: MyAppColors.redcolor,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      style: GoogleFonts.roboto(
                                          //fontFamily: 'Gilroy',
                                          color: MyAppColors.blackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                      text:
                                          "dictum id nulla. Risus ullamcorper sapien nibh eu nulla platea. Aliquam ipsum,"),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("\$45",
                                        style: GoogleFonts.roboto(
                                            // fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
