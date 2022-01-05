import 'dart:io';
import 'dart:ui';

//Included widgets
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it you
      //can now select photo.
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
  }

  /// Get from camera
  _getFromCamera() async {
    if (await Permission.camera.request().isGranted) {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        imageFile = XFile(pickedFile.path);
      }
      setState(() {});
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
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    margin: EdgeInsets.only(top: 15),
                    height: 200,
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
                            if (this.imageFile == null)
                              GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Add Photo',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Times New Roman'),
                                  ))
                          ],
                        ),
                        Expanded(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (this.imageFile == null)
                              Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              this._getFromCamera();
                                            },
                                            child: Icon(
                                              FontAwesomeIcons.camera,
                                              size: 70,
                                            ),
                                          ),
                                          Text(
                                            'Camera',
                                            style: TextStyle(
                                                fontFamily: 'Times New Roman'),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              this._getFromGallery();
                                            },
                                            child: Icon(
                                              FontAwesomeIcons.file,
                                              size: 70,
                                            ),
                                          ),
                                          Text('Get from gallery',
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Times New Roman'))
                                        ],
                                      )),
                                ],
                              ))
                            else
                              Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Image.file(File(imageFile!.path)))
                          ],
                        ))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    margin: EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'General Information',
                          style: TextStyle(
                              fontSize: 25, fontFamily: 'Times New Roman'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Item Name',
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextFormField(
                            maxLines: 8,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Quantity',
                                      style: TextStyle(
                                          fontFamily: 'Times New Roman',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Price',
                                      style: TextStyle(
                                          fontFamily: 'Times New Roman',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                flex: 3,
                              ),
                              Flexible(
                                child: SizedBox(
                                  width: 1,
                                ),
                                flex: 1,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'State',
                                      style: TextStyle(
                                          fontFamily: 'Times New Roman',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size.fromHeight(10)),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 25)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xff303744)),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'NEW',
                                        style: TextStyle(
                                            color: const Color(0xffffffff),
                                            fontSize: 20),
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size.fromHeight(10)),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 25)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xff303744)),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'USED',
                                        style: TextStyle(
                                            color: const Color(0xffffffff),
                                            fontSize: 20),
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size.fromHeight(10)),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 25)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xff303744)),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'DMG',
                                        style: TextStyle(
                                            color: const Color(0xffffffff),
                                            fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                                flex: 3,
                              ),
                              Flexible(
                                child: SizedBox(
                                  width: 1,
                                ),
                                flex: 1,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tags',
                                      style: TextStyle(
                                          fontFamily: 'Times New Roman',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size.fromHeight(10)),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 5)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xffcf4e6c)),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                            color: const Color(0xffffffff),
                                            fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                                flex: 3,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size.fromHeight(10)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xffcf4e6c)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Create offer',
                            style: TextStyle(
                                color: const Color(0xffffffff), fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  )
                ]))
              ],
            ),
          ),
        ));
  }
}
