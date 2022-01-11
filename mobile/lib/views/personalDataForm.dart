import 'dart:ui';

//Components
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/database.dart';
import 'package:provider/provider.dart';

class PersonalDataForm extends StatefulWidget {
  const PersonalDataForm({Key? key}) : super(key: key);

  @override
  _PersonalDataForm createState() => _PersonalDataForm();
}

class _PersonalDataForm extends State<PersonalDataForm> {
  late String nameField = '';
  late String surnameField = '';
  late int ageField = 0;
  late num phoneField = 0;
  late String countryField = '';
  late String cityField = '';
  late String postalCodeField = '';
  late String addressField = '';

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AppUser>(context);
    final users = Provider.of<List<OurUser>>(context);
    final DatabaseService database = DatabaseService(uid: auth.uid);

    var name = users.firstWhere((element) => element.uid == auth.uid).name;
    var surname = users.firstWhere((element) => element.uid == auth.uid).surname;
    var age = users.firstWhere((element) => element.uid == auth.uid).age == 0 ? '' : users.firstWhere((element) => element.uid == auth.uid).age.toString();
    var phone = users.firstWhere((element) => element.uid == auth.uid).phone == 0 ? '' : users.firstWhere((element) => element.uid == auth.uid).phone.toString();
    var country = users.firstWhere((element) => element.uid == auth.uid).country;
    var city = users.firstWhere((element) => element.uid == auth.uid).city;
    var postalCode = users.firstWhere((element) => element.uid == auth.uid).postalCode;
    var address = users.firstWhere((element) => element.uid == auth.uid).address;

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
                      onChanged: (value) {
                        setState(() {
                          nameField = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: name,
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
                      onChanged: (value) {
                        setState(() {
                          surnameField = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: surname,
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
                      onChanged: (value) {
                        setState(() {
                          if(value.isNotEmpty) ageField = int.parse(value);
                          else ageField = 0;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: age,
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
                      onChanged: (value) {
                        setState(() {
                          if(value.isNotEmpty) phoneField = num.parse(value);
                          else phoneField = 0;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: phone,
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
                      onChanged: (value) {
                        setState(() {
                          countryField = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: country,
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
                      onChanged: (value) {
                        setState(() {
                          cityField = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: city,
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
                      onChanged: (value) {
                        setState(() {
                          postalCodeField = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: postalCode,
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
                      onChanged: (value) {
                        setState(() {
                          addressField = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: address,
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
                      GestureDetector(
                        onTap: () {
                          database.updateUserData(
                              auth.uid,
                              nameField == '' ? name : nameField,
                              surnameField == '' ? surname : nameField,
                              ageField == 0 ? age == '' ? 0 : int.parse(age) : ageField,
                              phoneField == 0 ? phone == '' ? 0 : num.parse(phone) : phoneField,
                              countryField == '' ? country : countryField,
                              cityField == '' ? city : cityField,
                              postalCodeField == '' ? postalCode : postalCodeField,
                              addressField == '' ? address : addressField
                          );

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Success"),
                                  content: const Text(
                                      "Your personal data has beed saved."),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                            Navigator.pop(context, 'Cancel');
                                        },
                                        child: const Text('OK'))
                                  ],
                                );
                              });
                        },
                        child: Container(
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
