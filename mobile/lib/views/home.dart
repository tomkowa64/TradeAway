import 'dart:ui';

//Components
import 'package:mobile/components/homeCategoryTile.dart';
import 'package:mobile/components/saleList.dart';
import 'package:mobile/components/trendsList.dart';
import 'package:mobile/components/yourPicksList.dart';
import 'package:mobile/inc/navigationDrawer.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/transaction.dart';

//Included widgets
import '../inc/nav.dart';
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
    final products = Provider.of<List<Product>>(context).where((element) => element.units > 0).toList();
    final transactions = Provider.of<List<OurTransaction>>(context).where((element) => element.clientId == user!.uid);

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
                                'RTV/AGD', 0),
                            HomeCategoryTile(
                                const FaIcon(
                                  FontAwesomeIcons.tshirt,
                                  color: Color(0xffcfcfcf),
                                ),
                                'Clothing', 1),
                            HomeCategoryTile(
                                const FaIcon(
                                  FontAwesomeIcons.couch,
                                  color: Color(0xffcfcfcf),
                                ),
                                'Furniture', 2),
                            HomeCategoryTile(
                                const FaIcon(
                                  FontAwesomeIcons.paperclip,
                                  color: Color(0xffcfcfcf),
                                ),
                                'Office', 3),
                            HomeCategoryTile(
                                const FaIcon(
                                  FontAwesomeIcons.basketballBall,
                                  color: Color(0xffcfcfcf),
                                ),
                                'Sport', 4),
                          ], scrollDirection: Axis.horizontal),
                        ),
                        //Section Title
                        if (products.where((element) => element.discount > 0).isNotEmpty) Container(
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
                        if (products.where((element) => element.discount > 0).isNotEmpty) Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10),
                            color: const Color(0xffffffff),
                            height: 300.0,
                            child: const SaleList()),
                        //Section Title
                        if (products.where((element) => element.discount > 0).isNotEmpty) Container(
                          margin: const EdgeInsets.only(top: 30),
                        ),
                        Container(
                          color: Colors.white,
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
                        if (transactions.length > 0) Container(
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
                        if (transactions.length > 0) Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10),
                            color: const Color(0xffffffff),
                            height: 300.0,
                            child: const YourPicksList()
                        )
                      ],
                    ))
                  ],
                )),
          )),
    );
  }
}
