import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/components/cartProductCard.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/transaction.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/database.dart';
import 'package:mobile/views/transactions.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Cart();
  }
}

class _Cart extends State<Cart> {
  var cart = FlutterCart();

  @override
  Widget build(BuildContext context) {
    bool exists = false;

    final auth = Provider.of<AppUser>(context);
    final carts = Provider.of<List<Map<String, dynamic>>>(context);
    final products = Provider.of<List<Product>>(context);
    final users = Provider.of<List<OurUser>>(context);
    final transactions = Provider.of<List<OurTransaction>>(context);
    final DatabaseService database = DatabaseService(uid: auth.uid);

    cart.deleteAllCart();
    if (carts.isNotEmpty) {
      for (var value in carts.toList()) {
        if (value.values.toList()[0] == auth.uid &&
            value.values.toList()[1].toString().length > 2) {
          exists = true;
          break;
        }
      }
    }

    if (exists) {
      if (carts
              .firstWhere((element) => element.values.toList()[0] == auth.uid)
              .values
              .toList()
              .length >
          1) {
        carts
            .firstWhere((element) => element.values.toList()[0] == auth.uid)
            .values
            .toList()[1]
            .toString()
            .substring(
                1,
                carts
                        .firstWhere(
                            (element) => element.values.toList()[0] == auth.uid)
                        .values
                        .toList()[1]
                        .toString()
                        .length -
                    1)
            .split(',')
            .forEach((element) {
          cart.addToCart(
              productId: element.trim().split(':')[0],
              quantity: int.parse(element.trim().split(':')[1].trim()),
              unitPrice: products
                      .firstWhere((product) =>
                          product.id == int.parse(element.trim().split(':')[0]))
                      .price -
                  products
                      .firstWhere((product) =>
                          product.id == int.parse(element.trim().split(':')[0]))
                      .discount);
        });
      }
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Cart',
                    style:
                        TextStyle(fontSize: 30, fontFamily: 'Times New Roman'),
                  )
                ],
              ),
              //Cart Items List
              SizedBox(
                height: 450,
                width: MediaQuery.of(context).size.width - 20,
                child: SingleChildScrollView(
                  child: Column(
                    children:
                        List.generate(cart.cartItem.toList().length, (index) {
                      return CartProductCard(
                          num.parse(cart.cartItem.toList()[index].productId),
                          '0_' +
                              products
                                  .firstWhere((element) =>
                                      element.id.toString() ==
                                      cart.cartItem.toList()[index].productId)
                                  .name,
                          products
                              .firstWhere((element) =>
                                  element.id.toString() ==
                                  cart.cartItem.toList()[index].productId)
                              .name,
                          users
                                  .firstWhere((element) =>
                                      element.uid ==
                                      products
                                          .firstWhere((element) =>
                                              element.id.toString() ==
                                              cart.cartItem
                                                  .toList()[index]
                                                  .productId)
                                          .seller)
                                  .name +
                              ' ' +
                              users
                                  .firstWhere((element) =>
                                      element.uid ==
                                      products
                                          .firstWhere((element) =>
                                              element.id.toString() ==
                                              cart.cartItem
                                                  .toList()[index]
                                                  .productId)
                                          .seller)
                                  .surname,
                          double.parse(cart.cartItem
                              .toList()[index]
                              .unitPrice
                              .toString()),
                          cart.cartItem.toList()[index].quantity);
                    }),
                  ),
                ),
              ),
              //Finalize order
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Times New Roman'),
                        ),
                        Text(
                          '\$' +
                              ((cart.getTotalAmount() * 100).round() / 100)
                                  .toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Times New Roman'),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (cart.cartItem.toList().isNotEmpty) {
                              int id;
                              if (transactions.isEmpty) {
                                id = 0;
                              } else {
                                id = transactions.last.transactionId + 1;
                              }
                              for (var item in cart.cartItem.toList()) {
                                database.updateTransactionData(
                                    id,
                                    item.productId.toString(),
                                    products
                                        .firstWhere((element) =>
                                            element.id ==
                                            num.parse(
                                                item.productId.toString()))
                                        .seller,
                                    auth.uid,
                                    item.unitPrice,
                                    item.quantity,
                                    'In Progress',
                                    Timestamp.now());
                                database.updateProductData(
                                    int.parse(item.productId.toString()),
                                    products
                                        .firstWhere((element) =>
                                            element.id ==
                                            num.parse(
                                                item.productId.toString()))
                                        .name,
                                    products
                                        .firstWhere((element) =>
                                            element.id ==
                                            num.parse(
                                                item.productId.toString()))
                                        .description,
                                    products
                                        .firstWhere((element) =>
                                            element.id ==
                                            num.parse(
                                                item.productId.toString()))
                                        .price
                                        .toDouble(),
                                    products
                                        .firstWhere((element) =>
                                            element.id ==
                                            num.parse(
                                                item.productId.toString()))
                                        .discount
                                        .toDouble(),
                                    products
                                        .firstWhere((element) =>
                                            element.id ==
                                            num.parse(
                                                item.productId.toString()))
                                        .seller,
                                    products
                                        .firstWhere((element) =>
                                            element.id ==
                                            num.parse(
                                                item.productId.toString()))
                                        .category
                                        .toInt(),
                                    products
                                            .firstWhere((element) =>
                                                element.id ==
                                                num.parse(
                                                    item.productId.toString()))
                                            .units
                                            .toInt() -
                                        item.quantity,
                                    products
                                        .firstWhere((element) =>
                                            element.id ==
                                            num.parse(
                                                item.productId.toString()))
                                        .state);
                                id++;
                              }
                              database.deleteCartData();
                              cart.deleteAllCart();

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Success"),
                                      content: const Text(
                                          "Transactions successfully created."),
                                      actions: [
                                        TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Back')),
                                        TextButton(
                                            onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Transactions())),
                                            child:
                                                const Text('My Transactions'))
                                      ],
                                    );
                                  });
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: MediaQuery.of(context).size.width - 50,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                color: const Color(0xffcf4e6c),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              'Purchase Items',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: 'Times New Roman'),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
              //List of Cart Items
            ]))
          ],
        ),
      ),
    ));
  }
}
