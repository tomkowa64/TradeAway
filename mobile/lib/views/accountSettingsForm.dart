import 'dart:ui';

//Components
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/shopProductItem.dart';
import 'package:mobile/inc/navigationDrawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountSettingsForm extends StatefulWidget {
  @override
  _AccountSettingsFormState createState() => _AccountSettingsFormState();
}

class _AccountSettingsFormState extends State<AccountSettingsForm> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                    'E-mail',
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
                          prefixIcon: Icon(FontAwesomeIcons.envelope),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: 'annja@ex.com',
                          hintStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  //End of Item
                  //Begin of an item
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Password',
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
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          prefixIcon: Icon(FontAwesomeIcons.lock),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontSize: 15,
                          )),
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

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
