import 'dart:ui';

//Components
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile/components/homeCategoryTile.dart';
import 'package:mobile/components/homeProductItem.dart';
import 'package:mobile/components/saleList.dart';
import 'package:mobile/components/trendsList.dart';
import 'package:mobile/components/yourPicksList.dart';
import 'package:mobile/inc/navigationDrawer.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/user.dart';

//Views for Navigator
import './login.dart';
import './register.dart';

//Included widgets
import '../inc/nav.dart';
import '../inc/bottomMenu.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    return StreamProvider<List<Product>>.value(
      value: DatabaseService().products,
      initialData: const [],
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Nav(),
          ),
          drawer: NavigationDrawer(),
          body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Tile Category List
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 10),
                          height: 140.0,
                          child: ListView(children: [
                            //Redirect to shop with this category applied as filter - RTV/AGD
                            HomeCategoryTile(
                                const FaIcon(
                                  FontAwesomeIcons.plug,
                                  color: Color(0xffcfcfcf),
                                ),
                                'RTV/AGD'),
                            HomeCategoryTile(
                                const FaIcon(
                                  FontAwesomeIcons.tshirt,
                                  color: Color(0xffcfcfcf),
                                ),
                                'Clothing'),
                            HomeCategoryTile(
                                const FaIcon(
                                  FontAwesomeIcons.couch,
                                  color: Color(0xffcfcfcf),
                                ),
                                'Furniture'),
                            HomeCategoryTile(
                                const FaIcon(
                                  FontAwesomeIcons.paperclip,
                                  color: Color(0xffcfcfcf),
                                ),
                                'Office'),
                            HomeCategoryTile(
                                const FaIcon(
                                  FontAwesomeIcons.basketballBall,
                                  color: Color(0xffcfcfcf),
                                ),
                                'Sport'),
                          ], scrollDirection: Axis.horizontal),
                        ),
                        //Section Title
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: const [
                              Text(
                                "Sale",
                                style: TextStyle(
                                    color: Color(0xff304744),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        //Sale product list
                        Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10),
                            color: const Color(0xffffffff),
                            height: 300.0,
                            child: const SaleList()),
                        //Section Title
                        Container(
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: const [
                              Text(
                                "Trending",
                                style: TextStyle(
                                    color: Color(0xff304744),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        //Trending Section
                        Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10),
                            color: const Color(0xffffffff),
                            height: 300.0,
                            child: const TrendsList()),
                        Container(
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: const [
                              Text(
                                "Your Picks",
                                style: TextStyle(
                                    color: Color(0xff304744),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        //Your Picks Section
                        Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10),
                            color: const Color(0xffffffff),
                            height: 300.0,
                            child: const YourPicksList()
                            // ListView(children: [
                            //   HomeProductItem('assets/images/backpack.png',
                            //       'Backpack Adidas Premium', 69.99, 49.99),
                            //   HomeProductItem('assets/images/blender.png',
                            //       'Blender', 69.99, 49.99),
                            //   HomeProductItem('assets/images/sample-product.jpg',
                            //       'Backpack Adidas Premium', 69.99, 49.99),
                            // ], scrollDirection: Axis.horizontal),
                            )
                      ],
                    ))
                  ],
                )),
          )),
    );
  }
}
