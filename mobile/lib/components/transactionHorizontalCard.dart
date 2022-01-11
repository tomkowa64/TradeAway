import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/transaction.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/database.dart';
import 'package:mobile/services/storage.dart';
import 'package:provider/provider.dart';

class TransactionHorizontalCard extends StatefulWidget {
  late int _transactionId;
  late String _sellerAvatarUrl;
  late String _productName;
  late String _description;
  late double _price;
  late num _productId;
  late String _productImgUrl;
  late bool _isSeller;

  TransactionHorizontalCard(this._transactionId, this._sellerAvatarUrl, this._productName,
      this._description, this._price, this._productId, this._productImgUrl,
      this._isSeller);

  @override
  State<StatefulWidget> createState() {
    return _TransactionHorizontalCard();
  }
}

class _TransactionHorizontalCard extends State<TransactionHorizontalCard> {
  String get sellerAvatarUrl => widget._sellerAvatarUrl;

  int get transactionId => widget._transactionId;

  num get productId => widget._productId;

  set sellerAvatarUrl(String value) {
    widget._sellerAvatarUrl = value;
  }

  String get productName => widget._productName;

  set productName(String value) {
    widget._productName = value;
  }

  String get description => widget._description;

  set description(String value) {
    widget._description = value;
  }

  double get price => widget._price;

  set price(double value) {
    widget._price = value;
  }

  String get productImgUrl => widget._productImgUrl;

  set productImgUrl(String value) {
    widget._productImgUrl = value;
  }

  bool get isSeller => widget._isSeller;

  set isSeller(bool value) {
    widget._isSeller = value;
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AppUser>(context);
    final users = Provider.of<List<OurUser>>(context);
    final Storage storage = Storage();
    final transactions = Provider.of<List<OurTransaction>>(context);
    final DatabaseService database = DatabaseService(uid: auth.uid);
    final products = Provider.of<List<Product>>(context);
    var userTransactions = transactions.where((element) => element.clientId == auth.uid || element.sellerId == auth.uid).toList();
    userTransactions = userTransactions.where((element) => element.status != 'Cancelled' && element.status != 'Ended').toList();
    String status = userTransactions.firstWhere((element) => element.transactionId == transactionId).status;

    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0.5,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  )
                                ]),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 120,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: FutureBuilder(
                                          future: storage.getAvatarURL(sellerAvatarUrl),
                                          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                            if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                                              return CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage: NetworkImage(snapshot.data!),
                                                  backgroundColor: const Color(0x00000000)
                                              );
                                            }
                                            if(snapshot.connectionState == ConnectionState.waiting) {
                                              return SizedBox(
                                                child: CircularProgressIndicator(),
                                                height: 80,
                                                width: 80,
                                              );
                                            }
                                            if(!snapshot.hasData) {
                                              return CircleAvatar(
                                                radius: 40,
                                                backgroundColor: const Color(0xffcf4e6c),
                                                child: Text(
                                                    users.firstWhere((element) => element.uid == sellerAvatarUrl).name.substring(0, 1) + users.firstWhere((element) => element.uid == sellerAvatarUrl).surname.substring(0, 1),
                                                    style: const TextStyle(
                                                        fontSize: 40,
                                                        color: Colors.white,
                                                        fontFamily: 'Times New Roman')),
                                              );
                                            }
                                            return Container();
                                          }
                                      ),
                                      flex: 3,
                                    ),
                                    Flexible(
                                      child: SizedBox(),
                                      flex: 1,
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              '${productName}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      'Times New Roman'),
                                            ),
                                          ),
                                          Text(
                                            '\$${price}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontFamily: 'Times New Roman'),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${description}\n',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              )
                                            ],
                                          ),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              '${status}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                  'Times New Roman'),
                                            ),
                                          )
                                        ],
                                      ),
                                      flex: 6,
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              child: AspectRatio(
                                                aspectRatio: 1/1,
                                                child: FutureBuilder(
                                                    future: storage.getURL(productId, productImgUrl),
                                                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                      if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                                                        return Image.network(snapshot.data!, fit: BoxFit.cover);
                                                      }
                                                      if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                                                        return CircularProgressIndicator();
                                                      }
                                                      return Container();
                                                    }
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                      flex: 3,
                                    )
                                  ],
                                )),
                          )
                        ],
                      )),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffcf4e6c),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Flexible(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text("Cancel Transaction"),
                                              content: const Text(
                                                  "Are you sure you want to cancel transaction?"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () => Navigator.pop(
                                                        context, 'Cancel'),
                                                    child: const Text('No')),
                                                TextButton(
                                                    onPressed: () {
                                                      database.updateTransactionData(
                                                          transactionId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).productId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).sellerId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).clientId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).price,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).quantity,
                                                          'Cancelled',
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).date
                                                      );

                                                      database.updateProductData(
                                                          productId.toInt(),
                                                          products.firstWhere((element) => element.id == productId).name,
                                                          products.firstWhere((element) => element.id == productId).description,
                                                          products.firstWhere((element) => element.id == productId).price.toDouble(),
                                                          products.firstWhere((element) => element.id == productId).discount.toDouble(),
                                                          products.firstWhere((element) => element.id == productId).seller,
                                                          products.firstWhere((element) => element.id == productId).category.toInt(),
                                                          products.firstWhere((element) => element.id == productId).units.toInt() + userTransactions.firstWhere((element) => element.transactionId == transactionId).quantity.toInt(),
                                                          products.firstWhere((element) => element.id == productId).state
                                                      );
                                                      Navigator.pop(context, 'Cancel');
                                                    },
                                                    child:
                                                    const Text('Yes'))
                                              ],
                                            );
                                          }
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Column(
                                        children: [
                                          Icon(FontAwesomeIcons.ban),
                                          Text(
                                            'Cancel',
                                            style: TextStyle(
                                                fontFamily: 'Times New Roman'),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              flex: 1,
                            ),
                          Flexible(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if(isSeller == true && status == 'In Progress') {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text("Confirm Payment"),
                                              content: const Text(
                                                  "Are you sure you got payment from client for this product?"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () => Navigator.pop(
                                                        context, 'Cancel'),
                                                    child: const Text('No')),
                                                TextButton(
                                                    onPressed: () {
                                                      database.updateTransactionData(
                                                          transactionId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).productId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).sellerId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).clientId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).price,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).quantity,
                                                          'Paid',
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).date
                                                      );
                                                      setState(() {
                                                        status = 'Paid';
                                                      });
                                                      Navigator.pop(context, 'Cancel');
                                                    },
                                                    child: const Text('Yes')),
                                              ],
                                            );
                                          }
                                      );
                                    } else if(isSeller == true) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text("Payment already confirmed"),
                                              content: const Text(
                                                  "Wait for client to confirm product delivery."),
                                              actions: [
                                                TextButton(
                                                    onPressed: () => Navigator.pop(
                                                        context, 'Cancel'),
                                                    child: const Text('OK')),
                                              ],
                                            );
                                          }
                                      );
                                    }

                                    if(isSeller == false && status == 'Paid') {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text("Confirm Payment"),
                                              content: const Text(
                                                  "Are you sure you got payment from client for this product?"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () => Navigator.pop(
                                                        context, 'Cancel'),
                                                    child: const Text('No')),
                                                TextButton(
                                                    onPressed: () {
                                                      database.updateTransactionData(
                                                          transactionId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).productId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).sellerId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).clientId,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).price,
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).quantity,
                                                          'Ended',
                                                          userTransactions.firstWhere((element) => element.transactionId == transactionId).date
                                                      );
                                                      setState(() {
                                                        status = 'Ended';
                                                      });
                                                      Navigator.pop(context, 'Cancel');
                                                    },
                                                    child: const Text('Yes')),
                                              ],
                                            );
                                          }
                                      );
                                    } else if(isSeller == false) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text("Wait for payment confirmation"),
                                              content: const Text(
                                                  "Wait for seller to confirm payment delivery."),
                                              actions: [
                                                TextButton(
                                                    onPressed: () => Navigator.pop(
                                                        context, 'Cancel'),
                                                    child: const Text('OK')),
                                              ],
                                            );
                                          }
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.checkDouble,
                                          color: Colors.white,
                                        ),
                                        if(isSeller == true)
                                          Text('Confirm payment',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Times New Roman'))
                                        else
                                          Text('Confirm delivery',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Times New Roman'))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            flex: 4,
                          )
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
