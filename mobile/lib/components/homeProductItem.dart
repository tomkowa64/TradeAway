import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/services/storage.dart';

class HomeProductItem extends StatelessWidget {
  late num _productId;
  late String _imgUrl;
  late String _productName;
  num? _oldPrice;
  late num _price;

  HomeProductItem(this._productId, this._imgUrl, this._productName, this._price,
      [this._oldPrice]);

  HomeProductItem.empty(
      num productId, String imgUrl, String productName, num oldPrice, num price) {
    this._productId = 0;
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

  num? get oldPrice => _oldPrice;

  set oldPrice(num? value) {
    _oldPrice = value;
  }

  num get price => _price;

  set price(num value) {
    _price = value;
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'Product');
      },
      child: Card(
          child: new Container(
        width: 150.0,
        padding: EdgeInsets.all(5),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder(
                future: storage.getURL(this._productId, this._imgUrl),
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
            // Image.asset(this.imgUrl),
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
                onPressed: () async {
                  // ListResult results = await storage.storage.ref('products/' + this._productId.toString()).listAll();
                  // storage.uploadFile(this._productId, '/sdcard/Download/blender.png', results.items.length.toString() + '_' + this._productName);
                },
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
