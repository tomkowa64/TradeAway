import 'dart:ui';

//Components
import 'package:mobile/components/shopProductItem.dart';
import 'package:mobile/inc/navigationDrawer.dart';

//Included widgets
import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

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
                      //Favourites items grid
                      SizedBox(
                        height: 1000,
                        child: GridView.count(
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            childAspectRatio: 100 / 190,
                            shrinkWrap: true,
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 30),
                            // Generate 100 widgets that display their index in the List.
                            children: List.generate(100, (index) {
                              return ShopProductItem(
                                  'assets/images/backpack.png',
                                  'Backpack Adidas',
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                                      ' sed do eiusmod tempor incididunt ut labore et dolore'
                                      ' magna aliqua. Ut enim ad minim veniam, quis nostrud '
                                      'exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                                      ' Duis aute irure dolor in reprehenderit in voluptate velit esse'
                                      ' cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat '
                                      'cupidatat non proident, sunt in culpa qui officia '
                                      'deserunt mollit anim id est laborum.',
                                  69.99,
                                  true);
                            })),
                      )
                    ],
                  ))
                ],
              )),
        ));
  }
}
