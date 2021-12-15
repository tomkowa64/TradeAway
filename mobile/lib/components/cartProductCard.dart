import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartProductCard extends StatelessWidget {
  late String _imgUrl;
  late String _productName;
  late String _sellerName;
  late double _price;
  late int _quantity;

  CartProductCard(this._imgUrl, this._productName, this._sellerName,
      this._price, this._quantity);

  String get imgUrl => _imgUrl;

  set imgUrl(String value) {
    _imgUrl = value;
  }

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }

  String get sellerName => _sellerName;

  set sellerName(String value) {
    _sellerName = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Expanded(
                  //Product Image
                  child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: Image.asset('${this.imgUrl}'),
              ))
            ],
          ),
          Container(
              width: 150,
              padding: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Product Name
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${this.productName}',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'Times New Roman'),
                    ),
                  ),
                  //Product Seller
                  Text(
                    '${this.sellerName}',
                    style: TextStyle(
                        fontSize: 12,
                        color: const Color(0xff9e9e9e),
                        fontFamily: 'Times New Roman'),
                  ),
                  //Product Price
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '\$${this.price}',
                        style: TextStyle(
                            color: const Color(0xff303744),
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Times New Roman'),
                      ),
                    ),
                  )
                ],
              )),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          FontAwesomeIcons.minusCircle,
                          size: 25,
                        ),
                      ),
                      //Product Quantity
                      if (this.quantity >= 10)
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            '${this.quantity}',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        )
                      else
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            '0${this.quantity}',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          FontAwesomeIcons.plusCircle,
                          size: 25,
                          color: const Color(0xffcf4e6c),
                        ),
                      )
                    ],
                  ))
            ],
          )),
        ],
      ),
    );
  }
}
