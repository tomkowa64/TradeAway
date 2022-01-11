import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/transaction.dart';
import 'package:mobile/services/database.dart';
import 'package:mobile/services/storage.dart';
import 'package:provider/provider.dart';

class HistoryHorizontalCard extends StatelessWidget {
  late int _transactionId;
  late String _sellerAvatarUrl;
  late String _productName;
  late String _description;
  late double _price;
  late num _productId;
  late String _productImgUrl;
  late String _transactionDate;

  HistoryHorizontalCard(
      this._transactionId,
      this._sellerAvatarUrl,
      this._productName,
      this._description,
      this._price,
      this._productId,
      this._productImgUrl,
      this._transactionDate);

  int get transactionId => _transactionId;

  set transactionId(int value) {
    _transactionId = value;
  }

  num get productId => _productId;

  set productId(num value) {
    _productId = value;
  }

  String get sellerAvatarUrl => _sellerAvatarUrl;

  set sellerAvatarUrl(String value) {
    _sellerAvatarUrl = value;
  }

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get productImgUrl => _productImgUrl;

  set productImgUrl(String value) {
    _productImgUrl = value;
  }

  String get transactionDate => _transactionDate;

  set transactionDate(String value) {
    _transactionDate = value;
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AppUser>(context);
    final Storage storage = Storage();
    final transactions = Provider.of<List<OurTransaction>>(context);
    final DatabaseService database = DatabaseService(uid: auth.uid);
    final products = Provider.of<List<Product>>(context);
    var userTransactions = transactions.where((element) => element.clientId == auth.uid || element.sellerId == auth.uid).toList();
    userTransactions = userTransactions.where((element) => element.status == 'Cancelled' || element.status == 'Ended').toList();
    String status = userTransactions.firstWhere((element) => element.transactionId == transactionId).status;

    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${this.transactionDate}',
            style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: new Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              '${this.sellerAvatarUrl}')))),
                              flex: 3,
                            ),
                            Flexible(
                              child: SizedBox(),
                              flex: 1,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      '${this.productName}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Times New Roman'),
                                    ),
                                  ),
                                  Text(
                                    '\$${this.price}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontFamily: 'Times New Roman'),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${this.description}\n',
                                          overflow: TextOverflow.ellipsis,
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
              ))
        ],
      ),
    );
  }
}
