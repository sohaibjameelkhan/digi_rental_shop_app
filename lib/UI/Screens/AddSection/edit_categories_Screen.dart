// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/Colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils/res.dart';
import '../../Widgets/appbutton.dart';
import '../../Widgets/appbutton.dart';
import '../../Widgets/auth_textfield_widget.dart';

class EditCategories extends StatefulWidget {
  const EditCategories({Key? key}) : super(key: key);

  @override
  State<EditCategories> createState() => _EditCategoriesState();
}

class _EditCategoriesState extends State<EditCategories> {
  TextEditingController _categoryController = TextEditingController();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            onTap: () {
              Get.back();
              //   _loginUser(context);
              //   Get.to(const Bottomnavigation());
            },
            containerheight: 55,
            text: "Update Category",
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text("Edit Categorie",
                    style: GoogleFonts.roboto(
                        // fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700,
                        fontSize: 20)),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                      height: 150,
                      width: double.infinity,
                      // child: SvgPicture.asset(
                      //   Res.invitefriendbanner,
                      //   fit: BoxFit.cover,
                      // ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border:
                            Border.all(width: 3, color: MyAppColors.appColor),
                        //shape: BoxShape.circle,

                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: _image == null
                              ? AssetImage(Res.bannerhomepage)
                              : FileImage(_image!) as ImageProvider,
                        ),
                      ))),
              Positioned.fill(
                top: -60,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: IconButton(
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 19,
                            ),
                            onPressed: () {
                              getImage(true);
                            }),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyAppColors.appColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: authtextfieldWidget(
                headingtext: "",
                onPwdTap: () {
                  // setState(() {
                  //   isvisible = !isvisible;
                  // });
                },
                //    visible: isvisible,
                isPasswordField: false,
                suffixIcon2: Icons.visibility_off,
                suffixIcon: Res.emailicon,
                maxlength: 20,
                keyboardtype: TextInputType.text,
                authcontroller: _categoryController,
                showImage: false,
                showsuffix: false,
                showpassoricon: true,
                suffixImage: Res.personicon,
                text: "Enter Category Name",
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter more than 6 digit password";
                  } else if (value.length < 6)
                    return "Please Enter atleast 6 password";
                  return null;
                }),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Future getImage(bool gallery) async {
    ImagePicker picker = ImagePicker();

    PickedFile? pickedFile;
    // Let user select photo from gallery
    if (gallery) {
      pickedFile = await picker.getImage(
        source: ImageSource.gallery,
      );
    }
    // Otherwise open camera to get new photo
    else {
      pickedFile = await picker.getImage(
        source: ImageSource.camera,
      );
    }

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
