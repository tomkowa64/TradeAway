import 'dart:ui';

//Components
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/shopProductItem.dart';
import 'package:mobile/inc/navigationDrawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonalDataForm extends StatelessWidget {
  const PersonalDataForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: const Color(0xfff5f5f5)),
          padding: EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Label
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Icon(
                      FontAwesomeIcons.solidUserCircle,
                      size: 30,
                      color: const Color(0xff303744),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Personal Data',
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color(0xff303744),
                        ),
                      ),
                    ),
                  ]),
                  Divider(
                    thickness: 1,
                    color: const Color(0xff303744),
                  ),
                  //Begin of an item
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Name',
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
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: 'Anna',
                          hintStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  //End of Item
                  //Begin of an item
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Surname',
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
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: 'James',
                          hintStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  //End of Item
                  //Begin of an item
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Age',
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
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: '12',
                          hintStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  //End of Item
                  //Begin of an item
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Phone Number',
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
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: '123456789',
                          hintStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  //End of Item
                  //Begin of an item
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Country',
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
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: 'Poland',
                          hintStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  //End of Item
                  //Begin of an item
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'City',
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
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: 'Kolbuszowa',
                          hintStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  //End of Item
                  //Begin of an item
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Postal Code',
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
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: '36-100',
                          hintStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  //End of Item
                  //Begin of an item
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Address',
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
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: 'Lipinki Luzyckie, Laczna 43',
                          hintStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  //End of Item
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width - 50,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            color: const Color(0xffcf4e6c),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          'Save Data',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Times New Roman'),
                        ),
                      )
                    ],
                  )
                ],
              ))
            ],
          )),
    ));
  }
}
