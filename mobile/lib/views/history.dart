import 'dart:ui';

//Components
import 'package:mobile/components/historyHorizontalCard.dart';
import 'package:mobile/inc/navigationDrawer.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/transaction.dart';
import 'package:mobile/services/database.dart';
import 'package:provider/provider.dart';

//Included widgets
import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AppUser>(context);
    final products = Provider.of<List<Product>>(context);
    final transactions = Provider.of<List<OurTransaction>>(context);
    var userTransactions = transactions.where((element) => element.clientId == auth.uid || element.sellerId == auth.uid).toList();
    userTransactions = userTransactions.where((element) => element.status == 'Cancelled' || element.status == 'Ended').toList();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Nav(),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: Container(
              padding:
                  EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: const Color(0xfff5f5f5)),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                        children: List.generate(
                            userTransactions.length,
                            (index) {
                              String date;
                              if(userTransactions[index].date.toDate().day < 10) {
                                date = '0' + userTransactions[index].date.toDate().day.toString() + '.';
                              } else {
                                date = userTransactions[index].date.toDate().day.toString() + '.';
                              }
                              if(userTransactions[index].date.toDate().month < 10) {
                                date += '0' + userTransactions[index].date.toDate().month.toString() + '.';
                              } else {
                                date += userTransactions[index].date.toDate().month.toString() + '.';
                              }

                              date += userTransactions[index].date.toDate().year.toString();
                              if(userTransactions[index].quantity.toInt() > 1) {
                                return HistoryHorizontalCard(
                                    userTransactions[index].transactionId,
                                    userTransactions[index].sellerId,
                                    products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).name + ' x' + userTransactions[index].quantity.toString(),
                                    products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).description,
                                    userTransactions[index].price.toDouble() * userTransactions[index].quantity.toInt(),
                                    num.parse(userTransactions[index].productId),
                                    '0_' + products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).name,
                                    date
                                );
                              } else {
                                return HistoryHorizontalCard(
                                    userTransactions[index].transactionId,
                                    userTransactions[index].sellerId,
                                    products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).name,
                                    products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).description,
                                    userTransactions[index].price.toDouble(),
                                    num.parse(userTransactions[index].productId),
                                    '0_' + products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).name,
                                    date
                                );
                              }
                            }
                        ),
                  ))
                ],
              )),
        ));
  }
}
