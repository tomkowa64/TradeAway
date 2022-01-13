import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Slider import
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/database.dart';
import 'package:mobile/services/storage.dart';
import 'package:mobile/views/personalDataForm.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class ProductSilder extends StatefulWidget {
  const ProductSilder(
      {Key? key, required this.productId, required this.isFavorite})
      : super(key: key);
  final num productId;
  final bool isFavorite;

  @override
  State<StatefulWidget> createState() {
    return _Product();
  }
}

class _Product extends State<ProductSilder> {
  var cart = FlutterCart();
  final Storage storage = Storage();
  late Future<List<Image>> _future;
  int _current = 0;
  int qty = 1;
  final CarouselController _controller = CarouselController();
  late bool localFavorite;

  @override
  void initState() {
    _future = storage.listImages(widget.productId);
    localFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AppUser>(context);
    final DatabaseService database = DatabaseService(uid: auth.uid);
    final products = Provider.of<List<Product>>(context);
    final users = Provider.of<List<OurUser>>(context);
    final favorites = Provider.of<List<Map<String, dynamic>>>(context);

    var favoriteArray = [];
    if (favorites
            .firstWhere((element) => element.values.toList()[0] == auth.uid)
            .values
            .toList()
            .length >
        1) {
      favorites
          .firstWhere((element) => element.values.toList()[0] == auth.uid)
          .values
          .toList()[1]
          .toString()
          .substring(
              1,
              favorites
                      .firstWhere(
                          (element) => element.values.toList()[0] == auth.uid)
                      .values
                      .toList()[1]
                      .toString()
                      .length -
                  1)
          .split(',')
          .forEach((element) {
        favoriteArray.add(element.trim());
      });
    }
    localFavorite = favoriteArray.contains(widget.productId.toString());

    if (products.isEmpty || users.isEmpty) {
      Future.delayed(const Duration(milliseconds: 1), () {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductSilder(
                    productId: widget.productId,
                    isFavorite: widget.isFavorite)));
      });
    }

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 40),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            children: [
              // Favorite Icon
              if (localFavorite)
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  GestureDetector(
                      onTap: () {
                        database.updateFavoriteData(widget.productId);
                        setState(() {
                          localFavorite = !localFavorite;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          FontAwesomeIcons.solidHeart,
                          size: 30,
                        ),
                      ))
                ]),
              if (!localFavorite)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          database.updateFavoriteData(widget.productId);
                          setState(() {
                            localFavorite = !localFavorite;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            FontAwesomeIcons.heart,
                            size: 30,
                          ),
                        ))
                  ],
                ),
              // Image Carousel
              FutureBuilder(
                  future: _future,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Image>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Column(children: [
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5),
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black)
                                        .withOpacity(
                                            _current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      ]);
                    }
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    return Container();
                  }),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(
                    top: 20, right: 10, bottom: 10, left: 10),
                height: 1000,
                margin: const EdgeInsets.only(top: 40),
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
                  borderRadius: const BorderRadius.only(
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
                              products
                                  .where((element) =>
                                      element.id == widget.productId.toInt())
                                  .first
                                  .name,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.w500),
                            ),
                            //Product state
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 5, right: 15, bottom: 5, left: 15),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                  products
                                      .where((element) =>
                                          element.id ==
                                          widget.productId.toInt())
                                      .first
                                      .state,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15)),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Product seller
                              Text(
                                users
                                        .firstWhere((element) =>
                                            element.uid ==
                                            products
                                                .where((element) =>
                                                    element.id ==
                                                    widget.productId.toInt())
                                                .first
                                                .seller)
                                        .name +
                                    ' ' +
                                    users
                                        .firstWhere((element) =>
                                            element.uid ==
                                            products
                                                .where((element) =>
                                                    element.id ==
                                                    widget.productId.toInt())
                                                .first
                                                .seller)
                                        .surname,
                                style: const TextStyle(
                                    fontSize: 13, color: Color(0xff9e9e9e)),
                              ),
                              //Quantity left
                              Text(
                                products
                                        .where((element) =>
                                            element.id ==
                                            widget.productId.toInt())
                                        .first
                                        .units
                                        .toString() +
                                    ' items left',
                                style: const TextStyle(
                                    fontSize: 13, color: Color(0xff303744)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                    products
                                        .where((element) =>
                                            element.id ==
                                            widget.productId.toInt())
                                        .first
                                        .description,
                                    maxLines: 4,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        color: Color(0xff9e9e9e),
                                        fontFamily: 'Times New Roman')),
                              )
                            ],
                          ),
                        ),
                        //Product Price
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$' +
                                    (products
                                                .where((element) =>
                                                    element.id ==
                                                    widget.productId.toInt())
                                                .first
                                                .price -
                                            products
                                                .where((element) =>
                                                    element.id ==
                                                    widget.productId.toInt())
                                                .first
                                                .discount)
                                        .toString(),
                                style: const TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff303744),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Times New Roman'),
                              ),
                              //Quantity input
                              Container(
                                width: 120,
                                padding: const EdgeInsets.only(
                                    top: 5, right: 10, bottom: 5, left: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (qty <
                                              products
                                                  .where((element) =>
                                                      element.id ==
                                                      widget.productId.toInt())
                                                  .first
                                                  .units) qty++;
                                        });
                                      },
                                      child: const Icon(
                                        FontAwesomeIcons.plus,
                                        size: 15,
                                      ),
                                    ),
                                    Text(
                                      qty.toString(),
                                      style: const TextStyle(fontSize: 25),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (qty > 1) qty--;
                                        });
                                      },
                                      child: const Icon(
                                        FontAwesomeIcons.minus,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //Cart button
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xffcf4e6c)),
                                  padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                      const EdgeInsets.only(
                                          top: 10,
                                          right: 30,
                                          bottom: 10,
                                          left: 30)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                ),
                                onPressed: () {
                                  var thisUserDetails = users.firstWhere(
                                      (element) => element.uid == auth.uid);
                                  if (thisUserDetails.postalCode != '' &&
                                      thisUserDetails.address != '' &&
                                      thisUserDetails.country != '' &&
                                      thisUserDetails.phone != 0 &&
                                      thisUserDetails.age != 0 &&
                                      thisUserDetails.surname != '' &&
                                      thisUserDetails.city != '' &&
                                      thisUserDetails.name != '') {
                                    if (products
                                            .firstWhere((element) =>
                                                element.id ==
                                                widget.productId.toInt())
                                            .seller !=
                                        auth.uid) {
                                      cart.addToCart(
                                          productId: widget.productId,
                                          unitPrice: (products
                                                  .where((element) =>
                                                      element.id ==
                                                      widget.productId.toInt())
                                                  .first
                                                  .price -
                                              products
                                                  .where((element) =>
                                                      element.id ==
                                                      widget.productId.toInt())
                                                  .first
                                                  .discount),
                                          quantity: qty);
                                      database.updateCartData(cart);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  "Product added to cart"),
                                              content: const Text(
                                                  "Do you want to continue shopping or see your cart?"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context, 'Cancel');
                                                    },
                                                    child: const Text(
                                                        'Continue shopping')),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const Cart()));
                                                    },
                                                    child:
                                                        const Text('My Cart'))
                                              ],
                                            );
                                          });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  "It's your product"),
                                              content: const Text(
                                                  "You can't buy your own product."),
                                              actions: [
                                                TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'Cancel'),
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
                                            title: const Text(
                                                "Update Personal Data"),
                                            content: const Text(
                                                "To buy any product you need to specify your personal data first."),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, 'Cancel');
                                                  },
                                                  child: const Text('Back')),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const PersonalDataForm()));
                                                  },
                                                  child: const Text(
                                                      'Personal Data'))
                                            ],
                                          );
                                        });
                                  }
                                },
                                child: const Text(
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
