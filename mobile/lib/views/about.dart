import 'dart:ui';

//Components
import 'package:mobile/components/shopProductItem.dart';
import 'package:mobile/inc/navigationDrawer.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/services/database.dart';
import 'package:mobile/services/storage.dart';
import 'package:provider/provider.dart';

//Included widgets
import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Nav(),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                "Trade",
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Color(0xff303744),
                                    fontStyle: FontStyle.italic,
                                    fontFamily: "Lucida Calligraphy Italic"),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                "Away",
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Color(0xffcf4e6c),
                                    fontStyle: FontStyle.italic,
                                    fontFamily: "Lucida Calligraphy Italic"),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("The easiest way to sell unused things away",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xff9e9e9e)))
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Aplikacja powstala jako realizacja pracy inzynierskiej, "
                              "wszelkie oferty, notyfikacje jak i dane uzytkownikow "
                              "uzyte w serwisie zostaly wykonane na potrzeby"
                              "testow i sa dzielem fikcji. TradeAway  "
                              "projektem aplikacji sluzacej do sprzedazy przedmiotow "
                              "nieuzywanych badz zbednych, oferujac zysk "
                              "jej uzytkownikom.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff303744),
                                  fontFamily: "Times New Roman"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Prace wykonal",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff303744),
                                fontFamily: "Times New Roman"),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Karol Jasek",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: Color(0xff303744),
                                fontFamily: "Times New Roman"),
                          )
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Image.asset(
                                'assets/images/ur-logo.jpg',
                                height: 150,
                                width: 150,
                              ),
                            )
                          ]),
                    ],
                  ))
                ],
              )),
        ));
  }
}
