import 'dart:io';
import 'dart:ui';

//Included widgets
import 'package:image_picker/image_picker.dart';
import 'package:mobile/components/profileMenuHorizontalCard.dart';

import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/components/cartProductCard.dart';

class AddOfferForm extends StatefulWidget {
  @override
  _AddOfferFormState createState() => _AddOfferFormState();
}

class _AddOfferFormState extends State<AddOfferForm> {
  XFile? imageFile;

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? photo = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (photo != null) {
      imageFile = XFile(photo.path);
    }
    setState(() {});
  }

  /// Get from camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = XFile(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Nav(),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: const Color(0xfff5f5f5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(children: [
                  Text(
                    'Create Offer',
                    style:
                        TextStyle(fontSize: 25, fontFamily: 'Times New Roman'),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      height: 200,
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Add Photo',
                                    style: TextStyle(fontSize: 15),
                                  ))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (this.imageFile == null)
                                GestureDetector(
                                    onTap: () {
                                      this._getFromGallery();
                                    },
                                    child: Icon(
                                      FontAwesomeIcons.camera,
                                      size: 50,
                                    ))
                              else
                                Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.file(File(imageFile!.path)))
                            ],
                          )
                        ],
                      ))
                ]))
              ],
            ),
          ),
        ));
  }
}
