import 'dart:ui';

//Components
import 'package:mobile/components/shopProductItem.dart';
import 'package:mobile/components/transactionHorizontalCard.dart';
import 'package:mobile/inc/navigationDrawer.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/transaction.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/database.dart';
import 'package:provider/provider.dart';

//Included widgets
import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Transactions();
  }
}

class _Transactions extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AppUser>(context);
    final products = Provider.of<List<Product>>(context);
    final transactions = Provider.of<List<OurTransaction>>(context);
    final DatabaseService database = DatabaseService(uid: auth.uid);
    var userTransactions = transactions.where((element) => element.clientId == auth.uid || element.sellerId == auth.uid).toList();
    userTransactions = userTransactions.where((element) => element.status != 'Cancelled' && element.status != 'Ended').toList();

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
                    children: List.generate(
                        userTransactions.length,
                        (index) {
                          if(userTransactions[index].quantity.toInt() > 1) {
                            return TransactionHorizontalCard(
                                userTransactions[index].transactionId,
                                userTransactions[index].sellerId,
                                products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).name + ' x' + userTransactions[index].quantity.toString(),
                                products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).description,
                                userTransactions[index].price.toDouble() * userTransactions[index].quantity.toInt(),
                                num.parse(userTransactions[index].productId),
                                '0_' + products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).name,
                                userTransactions[index].sellerId == auth.uid
                            );
                          } else {
                            return TransactionHorizontalCard(
                                userTransactions[index].transactionId,
                                userTransactions[index].sellerId,
                                products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).name,
                                products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).description,
                                userTransactions[index].price.toDouble(),
                                num.parse(userTransactions[index].productId),
                                '0_' + products.firstWhere((element) => element.id.toString() == userTransactions[index].productId).name,
                                userTransactions[index].sellerId == auth.uid
                            );
                          }
                        }
                    )
                  ))
                ],
              )),
        ));
  }
}
