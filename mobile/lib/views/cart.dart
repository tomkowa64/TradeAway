import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/components/cartProductCard.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: const Color(0xfff5f5f5)),
        margin: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cart',
                    style:
                        TextStyle(fontSize: 30, fontFamily: 'Times New Roman'),
                  )
                ],
              ),
              //Cart Items List
              Container(
                height: 450,
                width: MediaQuery.of(context).size.width - 20,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CartProductCard('assets/images/backpack.png',
                          'Backpack Adidas', 'AmazingUser123', 69.99, 1),
                      CartProductCard('assets/images/backpack.png',
                          'Backpack Puma', 'AmazingUser123', 29.99, 3),
                      CartProductCard('assets/images/backpack.png',
                          'Backpack Kowalski', 'AmazingUser123', 39.99, 11),
                      CartProductCard('assets/images/backpack.png',
                          'Backpack Adidas', 'AmazingUser123', 69.99, 15),
                      CartProductCard('assets/images/backpack.png',
                          'Backpack Adidas', 'AmazingUser123', 69.99, 1),
                    ],
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
                        Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Times New Roman'),
                        ),
                        Text(
                          '\$45.99',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Times New Roman'),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width - 50,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: const Color(0xffcf4e6c),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
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
