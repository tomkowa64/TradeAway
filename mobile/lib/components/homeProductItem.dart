import 'dart:async';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/database.dart';
import 'package:mobile/services/storage.dart';
import 'package:mobile/views/cart.dart';
import 'package:mobile/views/personalDataForm.dart';
import 'package:mobile/views/product.dart';
import 'package:provider/provider.dart';

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

  num get productId => _productId;

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
    var cart = FlutterCart();
    final auth = Provider.of<AppUser>(context);
    final DatabaseService database = DatabaseService(uid: auth.uid);
    final products = Provider.of<List<Product>>(context);
    final Storage storage = Storage();
    final users = Provider.of<List<OurUser>>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductSilder(productId: this._productId)));
      },
      child: Card(
          child: new Container(
        width: 150.0,
        padding: EdgeInsets.all(5),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AspectRatio(
              aspectRatio: 1/1,
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
                  var thisUserDetails = users.firstWhere((element) => element.uid == auth.uid);
                  if(
                  thisUserDetails.postalCode != ''
                      && thisUserDetails.address != ''
                      && thisUserDetails.country != ''
                      && thisUserDetails.phone != 0
                      && thisUserDetails.age != 0
                      && thisUserDetails.surname != ''
                      && thisUserDetails.city != ''
                      && thisUserDetails.name != ''
                  ) {
                    if (products
                            .firstWhere(
                                (element) => element.id == productId.toInt())
                            .seller !=
                        auth.uid) {
                      cart.addToCart(
                          productId: productId,
                          unitPrice: (products
                                  .where((element) =>
                                      element.id == productId.toInt())
                                  .first
                                  .price -
                              products
                                  .where((element) =>
                                      element.id == productId.toInt())
                                  .first
                                  .discount),
                          quantity: 1);
                      database.updateCartData(cart);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Product added to cart"),
                              content: const Text(
                                  "Do you want to continue shopping or see your cart?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, 'Cancel');
                                    },
                                    child: const Text('Continue shopping')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
                                    },
                                    child: const Text('My Cart'))
                              ],
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("It's your product"),
                              content:
                                  const Text("You can't buy your own product."),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('OK')),
                              ],
                            );
                          });
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Update Personal Data"),
                            content: const Text(
                                "To buy any product you need to specify your personal data first."),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: const Text('Back')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalDataForm()));
                                  },
                                  child: const Text('Personal Data'))
                            ],
                          );
                        });
                  }
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
