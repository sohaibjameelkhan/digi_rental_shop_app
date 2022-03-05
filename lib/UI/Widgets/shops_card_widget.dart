import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_shop_app/UI/Widgets/shop_delete_confirm.dart';

import '../../Utils/Colors.dart';
import '../../Utils/res.dart';
import '../Screens/AddSection/catgories_view_screen.dart';
import '../Screens/AddSection/edit_shop_screen.dart';

class ShopsCardWidget extends StatelessWidget {
  final String shopName;
  final String shopImage;
  final String shopDescription;
  final String shopID;

  ShopsCardWidget(
      this.shopName, this.shopImage, this.shopDescription, this.shopID);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: InkWell(
        onTap: () {
          Get.to(CategoryView());
        },
        child: Container(
          height: 120,
          width: double.infinity,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CachedNetworkImage(
                              height: 50,
                              width: 60,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                              imageUrl: shopImage,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      SpinKitWave(
                                          color: MyAppColors.appColor,
                                          type: SpinKitWaveType.start),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error)),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(shopName,
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
                                Get.to(EditShopScreen(shopName, shopImage,
                                    shopDescription, shopID));
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
                                      return ShopDeleteConfirmDialog(shopID
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
                  SizedBox(
                    height: 8,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        style: GoogleFonts.roboto(
                            //fontFamily: 'Gilroy',
                            color: MyAppColors.blackcolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                        text: shopDescription),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    height: 6,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
