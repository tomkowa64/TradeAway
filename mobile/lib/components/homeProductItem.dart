import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeProductItem extends StatelessWidget {
  late String _imgUrl;
  late String _productName;
  double? _oldPrice;
  late double _price;

  HomeProductItem(this._imgUrl, this._productName, this._price,
      [this._oldPrice]);

  HomeProductItem.empty(
      String imgUrl, String productName, double oldPrice, double price) {
    this._imgUrl = "";
    this._productName = "";
    this._oldPrice = 0;
    this._price = 0;
  }

  String get imgUrl => _imgUrl;

  set imgUrl(String value) {
    _imgUrl = value;
  }

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }

  double? get oldPrice => _oldPrice;

  set oldPrice(double? value) {
    _oldPrice = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
          child: new Container(
        width: 150.0,
        padding: EdgeInsets.all(5),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(this.imgUrl),
            FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  this.productName,
                  style: TextStyle(
                      color: const Color(0xff303744),
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                )),
            if (this.oldPrice != null)
              Text(
                "${this.oldPrice} \$",
                style: TextStyle(
                    color: const Color(0xff9e9e9e),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough),
                textAlign: TextAlign.center,
              )
            else
              Text(""),
            Text(
              "${this.price} \$",
              style: TextStyle(
                  color: const Color(0xffcf4e6c),
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            TextButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  color: const Color(0xffcf4e6c),
                  child: (Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.cartArrowDown,
                        color: Colors.white,
                        size: 15,
                      )
                    ],
                  )),
                ))
          ],
        ),
        alignment: Alignment.center,
      )),
    );
  }
}
