import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/components/cartProductCard.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/database.dart';
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
    final auth = Provider.of<AppUser>(context);
    final carts = Provider.of<List<Map<String, dynamic>>>(context);
    final products = Provider.of<List<Product>>(context);
    final users = Provider.of<List<OurUser>>(context);

    // print(cart.getTotalAmount());
    // for (var value in cart.cartItem.toList()) {
    //   print(value.productId);
    // };

    cart.deleteAllCart();
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
          unitPrice: products.firstWhere((product) => product.id == int.parse(element.trim().split(':')[0])).price - products.firstWhere((product) => product.id == int.parse(element.trim().split(':')[0])).discount
      );
    });

    // print(cart.getTotalAmount());

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
                    children: List.generate(
                        cart.cartItem.toList().length,
                        (index) {
                          return CartProductCard(
                              num.parse(cart.cartItem.toList()[index].productId),
                              '0_' + products.firstWhere((element) => element.id.toString() == cart.cartItem.toList()[index].productId).name,
                              products.firstWhere((element) => element.id.toString() == cart.cartItem.toList()[index].productId).name,
                              users.firstWhere((element) => element.uid == products.firstWhere((element) => element.id.toString() == cart.cartItem.toList()[index].productId).seller).name
                              + ' ' +
                              users.firstWhere((element) => element.uid == products.firstWhere((element) => element.id.toString() == cart.cartItem.toList()[index].productId).seller).surname,
                              double.parse(cart.cartItem.toList()[index].unitPrice.toString()),
                              cart.cartItem.toList()[index].quantity
                          );
                        }
                    ),
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
                          '\$' + cart.getTotalAmount().toString(),
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
                        Container(
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
