import 'dart:ui';

//Components
import 'package:mobile/components/shopProductItem.dart';
import 'package:mobile/components/transactionHorizontalCard.dart';
import 'package:mobile/inc/navigationDrawer.dart';

//Included widgets
import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

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
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: const Color(0xfff5f5f5)),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TransactionHorizontalCard(
                          'assets/images/user-profile.jpeg',
                          'Backpack Adidas',
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
                              'eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                              'Ut enim ad minim veniam, quis nostrud exercitation ullamco'
                              ' laboris nisi ut aliquip ex ea commodo consequat. ',
                          69.99,
                          'assets/images/backpack.png',
                          false),
                      TransactionHorizontalCard(
                          'assets/images/user-profile.jpeg',
                          'Backpack Adidas',
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
                              'eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                              'Ut enim ad minim veniam, quis nostrud exercitation ullamco'
                              ' laboris nisi ut aliquip ex ea commodo consequat. ',
                          69.99,
                          'assets/images/backpack.png',
                          true),
                      TransactionHorizontalCard(
                          'assets/images/user-profile.jpeg',
                          'Backpack Adidas',
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
                              'eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                              'Ut enim ad minim veniam, quis nostrud exercitation ullamco'
                              ' laboris nisi ut aliquip ex ea commodo consequat. ',
                          69.99,
                          'assets/images/backpack.png',
                          true)
                    ],
                  ))
                ],
              )),
        ));
  }
}
