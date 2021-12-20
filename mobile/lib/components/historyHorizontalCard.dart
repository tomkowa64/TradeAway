import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HistoryHorizontalCard extends StatelessWidget {
  late String _sellerAvatarUrl;
  late String _productName;
  late String _description;
  late double _price;
  late String _productImgUrl;
  late String _transactionDate;

  HistoryHorizontalCard(
      this._sellerAvatarUrl,
      this._productName,
      this._description,
      this._price,
      this._productImgUrl,
      this._transactionDate);

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
                                          '${this.description}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      )
                                    ],
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
                                      child: Image.asset(
                                    '${this.productImgUrl}',
                                  ))
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
