// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_shop_app/UI/Screens/AddSection/product_view_screen.dart';
import 'package:rental_shop_app/UI/Widgets/category_delete_confirm.dart';
import 'package:rental_shop_app/Utils/Colors.dart';

import '../../../Utils/res.dart';
import '../../../Utils/res.dart';
import 'add_categories.dart';
import 'edit_categories_Screen.dart';

class CategoryView extends StatefulWidget {
  const CategoryView(
      {Key? key,
      menuScreenContext,
      bool? hideStatus,
      Null Function()? onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyAppColors.appColor,
        onPressed: () {
          Get.to(AddCategories());
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
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
                    width: 15,
                  ),
                  Text("Categories",
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
                    child: InkWell(
                      onTap: () {
                        Get.to(ProductViewScreen());
                      },
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Text("Tech",
                                        style: GoogleFonts.roboto(
                                            // fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Get.to(EditCategories());
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: MyAppColors.appColor,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return DeleteCategoryDialog(
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
