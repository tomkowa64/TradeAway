import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Slider import
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/storage.dart';
import 'package:provider/provider.dart';

class ProductSilder extends StatefulWidget {
  const ProductSilder({ Key? key, required this.productId }) : super(key: key);
  final num productId;

  @override
  State<StatefulWidget> createState() {
    return _Product();
  }
}

class _Product extends State<ProductSilder> {
  final Storage storage = Storage();
  late Future<List<Image>> _future;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    _future = storage.listImages(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    final users = Provider.of<List<OurUser>>(context);

    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 40),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: const Color(0xfff5f5f5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            children: [
              //Fauvorite Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      FontAwesomeIcons.heart,
                      size: 30,
                    ),
                  )
                ],
              ),
              //Image Carousel
              FutureBuilder(
                  future: _future,
                  builder: (BuildContext context, AsyncSnapshot<List<Image>> snapshot) {
                    if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                      return Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 330,
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      aspectRatio: 1.5,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _current = index;
                                        });
                                      },
                                      enlargeCenterPage: true,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: false,
                                    ),
                                    items: snapshot.data,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: snapshot.data!.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () => _controller.animateToPage(entry.key),
                                  child: Container(
                                    width: 20.0,
                                    height: 12.0,
                                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                        color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                            ? Colors.white
                                            : Colors.black)
                                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                                  ),
                                );
                              }).toList(),
                            ),
                          ]
                      );
                    }
                    if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                      print('loading');
                      return const CircularProgressIndicator();
                    }
                    return Container();
                  }
              ),
              Expanded(
                  child: Container(
                padding:
                    EdgeInsets.only(top: 20, right: 10, bottom: 10, left: 10),
                height: 1000,
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              //Product Name
                              products[widget.productId.toInt()].name,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.w500),
                            ),
                            //Product state
                            Container(
                              padding: EdgeInsets.only(
                                  top: 5, right: 15, bottom: 5, left: 15),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                  products[widget.productId.toInt()].state,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15)),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Product seller
                              Text(
                                users.firstWhere(
                                        (element) => element.uid == products[widget.productId.toInt()].seller
                                ).name
                                  + ' ' +
                                users.firstWhere(
                                        (element) => element.uid == products[widget.productId.toInt()].seller
                                ).surname,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: const Color(0xff9e9e9e)),
                              ),
                              //Quantity left
                              Text(
                                products[widget.productId.toInt()]
                                        .units
                                        .toString() +
                                    ' items left',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: const Color(0xff303744)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                    products[widget.productId.toInt()]
                                        .description,
                                    maxLines: 4,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: const Color(0xff9e9e9e),
                                        fontFamily: 'Times New Roman')),
                              )
                            ],
                          ),
                        ),
                        //Product Price
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$' +
                                    (products[widget.productId.toInt()].price -
                                            products[widget.productId.toInt()]
                                                .discount)
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    color: const Color(0xff303744),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Times New Roman'),
                              ),
                              //Quantity input
                              Container(
                                width: 120,
                                padding: EdgeInsets.only(
                                    top: 5, right: 10, bottom: 5, left: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.plus,
                                      size: 15,
                                    ),
                                    Text(
                                      '1',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Icon(
                                      FontAwesomeIcons.minus,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                              //Cart button
                              Container(
                                padding: EdgeInsets.only(
                                    top: 10, right: 30, bottom: 10, left: 30),
                                decoration: BoxDecoration(
                                    color: const Color(0xffcf4e6c),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Text(
                                  'Cart',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ))
            ],
          ))
        ],
      ),
    ));
  }
}
