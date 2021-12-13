import 'dart:ui';

//Components
import 'package:mobile/components/homeCategoryTile.dart';
import 'package:mobile/components/homeProductItem.dart';
import 'package:mobile/inc/navigationDrawer.dart';

//Views for Navigator
import './login.dart';
import './register.dart';

//Included widgets
import '../inc/nav.dart';
import '../inc/bottomMenu.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: const Color(0xfff5f5f5)),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Tile Category List
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),
                        height: 140.0,
                        child: new ListView(children: [
                          //Redirect to shop with this category applied as filter - RTV/AGD
                          HomeCategoryTile(
                              FaIcon(
                                FontAwesomeIcons.plug,
                                color: const Color(0xffcfcfcf),
                              ),
                              'RTV/AGD'),
                          HomeCategoryTile(
                              FaIcon(
                                FontAwesomeIcons.tshirt,
                                color: const Color(0xffcfcfcf),
                              ),
                              'Clothing'),
                          HomeCategoryTile(
                              FaIcon(
                                FontAwesomeIcons.couch,
                                color: const Color(0xffcfcfcf),
                              ),
                              'Furniture'),
                          HomeCategoryTile(
                              FaIcon(
                                FontAwesomeIcons.paperclip,
                                color: const Color(0xffcfcfcf),
                              ),
                              'Office'),
                          HomeCategoryTile(
                              FaIcon(
                                FontAwesomeIcons.basketballBall,
                                color: const Color(0xffcfcfcf),
                              ),
                              'Sport'),
                        ], scrollDirection: Axis.horizontal),
                      ),
                      //Section Title
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              "Sale",
                              style: TextStyle(
                                  color: const Color(0xff304744),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      //Sale product list
                      Container(
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          color: const Color(0xffffffff),
                          height: 300.0,
                          child: new ListView(
                              shrinkWrap: true,
                              children: [
                                HomeProductItem('assets/images/backpack.png',
                                    'Backpack Adidas Premium', 69.99, 49.99),
                                HomeProductItem('assets/images/blender.png',
                                    'Blender', 69.99, 49.99),
                                HomeProductItem(
                                    'assets/images/sample-product.jpg',
                                    'Backpack Adidas Premium',
                                    69.99,
                                    49.99),
                              ],
                              scrollDirection: Axis.horizontal),
                        ),
                      ),
                      //Section Title
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              "Trending",
                              style: TextStyle(
                                  color: const Color(0xff304744),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      //Trending Section
                      Container(
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          color: const Color(0xffffffff),
                          height: 300.0,
                          child: new ListView(children: [
                            HomeProductItem('assets/images/backpack.png',
                                'Backpack Adidas Premium', 69.99),
                            HomeProductItem('assets/images/blender.png',
                                'Blender', 69.99, 49.99),
                            HomeProductItem('assets/images/sample-product.jpg',
                                'Backpack Adidas Premium', 69.99, 49.99),
                          ], scrollDirection: Axis.horizontal),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              "Your Picks",
                              style: TextStyle(
                                  color: const Color(0xff304744),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      //Your Picks Section
                      Container(
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          color: const Color(0xffffffff),
                          height: 300.0,
                          child: new ListView(children: [
                            HomeProductItem('assets/images/backpack.png',
                                'Backpack Adidas Premium', 69.99, 49.99),
                            HomeProductItem('assets/images/blender.png',
                                'Blender', 69.99, 49.99),
                            HomeProductItem('assets/images/sample-product.jpg',
                                'Backpack Adidas Premium', 69.99, 49.99),
                          ], scrollDirection: Axis.horizontal),
                        ),
                      )
                    ],
                  ))
                ],
              )),
        ));
  }
}
