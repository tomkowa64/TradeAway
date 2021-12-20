import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionHorizontalCard extends StatelessWidget {
  late String _sellerAvatarUrl;
  late String _productName;
  late String _description;
  late double _price;
  late String _productImgUrl;
  late bool _isSeller;

  TransactionHorizontalCard(this._sellerAvatarUrl, this._productName,
      this._description, this._price, this._productImgUrl, this._isSeller);

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

  bool get isSeller => _isSeller;

  set isSeller(bool value) {
    _isSeller = value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 15),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              '${this.productName}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      'Times New Roman'),
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                Container(
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
                                )
                              ],
                            ),
                            flex: 1,
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.checkDouble,
                                        color: Colors.white,
                                      ),
                                      if (this.isSeller == true)
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
