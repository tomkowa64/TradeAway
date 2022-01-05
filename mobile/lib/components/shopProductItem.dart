import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/services/storage.dart';
import 'package:mobile/views/product.dart';

class ShopProductItem extends StatelessWidget {
  late num _productId;
  late String _imgUrl;
  late String _productName;
  late String _description;
  num? _oldPrice;
  late num _price;
  late bool _isFavourite;

  ShopProductItem(this._productId, this._imgUrl, this._productName, this._description,
      this._price, this._isFavourite, [this._oldPrice]);

  String get imgUrl => _imgUrl;

  set imgUrl(String value) {
    _imgUrl = value;
  }

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  num get price => _price;

  set price(num value) {
    _price = value;
  }

  bool get isFavourite => _isFavourite;

  set isFavourite(bool value) {
    _isFavourite = value;
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();

    return Center(
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductSilder(productId: this._productId)));
            },
            child: Container(
              padding:
                  EdgeInsets.only(top: 30, right: 10, bottom: 10, left: 10),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: FutureBuilder(
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
                    // Image.asset("${this.imgUrl}", fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${this.productName}",
                          style: TextStyle(
                              color: const Color(0xff303744), fontSize: 20),
                        )),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "${this.description}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10, color: const Color(0xff9e9e9e)),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text("\$${this.price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: "Times New Roman",
                                  color: const Color(0xff303744))),
                        ),
                        if (this.isFavourite == false)
                          GestureDetector(
                            onTap: (/*Add to favourite*/) {},
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: const Color(0xffcf4e6c),
                              ),
                              child: Icon(
                                FontAwesomeIcons.heart,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          )
                        else
                          GestureDetector(
                            onTap: (/*Remove from favourite*/) {},
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: const Color(0xffcf4e6c),
                              ),
                              child: Icon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
