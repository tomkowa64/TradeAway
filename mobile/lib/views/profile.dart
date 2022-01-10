import 'dart:ui';

//Included widgets
import 'package:mobile/components/profileMenuHorizontalCard.dart';

import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/components/cartProductCard.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: const Color(0xfff5f5f5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    //Container for User Image, Real Name and Email, show only after user provide those
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              //User Image - Not provided by user
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: const Color(0xffcf4e6c),
                                child: Text('AJ',
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontFamily: 'Times New Roman')),
                              ),
                              //User Image - Provided by user - TODO
                              //CircleAvatar(),
                              SizedBox(height: 10),
                              Text(
                                'Anna James',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Times New Roman'),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'annja@ex.com',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Times New Roman',
                                    color: const Color(0xff9e9e9e)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    //Actions list
                    Container(
                      child: Column(
                        children: [
                          //Action List Item
                          ProfileMenuHorizontalCard(
                              Icon(
                                Icons.compare_arrows,
                                size: 40,
                                color: const Color(0xff303744),
                              ),
                              'My Transactions',
                              'Transactions'),
                          ProfileMenuHorizontalCard(
                              Icon(
                                Icons.account_circle,
                                size: 40,
                                color: const Color(0xff303744),
                              ),
                              'Personal Data',
                              'PersonalData'),
                          ProfileMenuHorizontalCard(
                              Icon(
                                Icons.history,
                                size: 40,
                                color: const Color(0xff303744),
                              ),
                              'Order History',
                              'History'),
                          ProfileMenuHorizontalCard(
                              Icon(
                                Icons.info,
                                size: 40,
                                color: const Color(0xff303744),
                              ),
                              'About',
                              'PersonalData'),
                          ProfileMenuHorizontalCard(
                              Icon(
                                Icons.settings,
                                size: 40,
                                color: const Color(0xff303744),
                              ),
                              'Account',
                              'AccountSettings'),
                          ProfileMenuHorizontalCard(
                              Icon(
                                Icons.add_circle_outlined,
                                size: 40,
                                color: const Color(0xff303744),
                              ),
                              'Create Offer',
                              'AddOffer'),
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
