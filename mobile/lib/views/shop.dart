import 'dart:async';
import 'dart:ui';

//Components
import 'package:mobile/components/shopProductItem.dart';
import 'package:mobile/inc/navigationDrawer.dart';
import 'package:mobile/models/product.dart';
import 'package:provider/provider.dart';

//Included widgets
import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _ShopState extends State<Shop> {
  final _debouncer = Debouncer(milliseconds: 500);
  static List<Product> filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context, listen: false);
    if (filteredProducts.isEmpty) {
      filteredProducts = List.from(products);
      filteredProducts =
          filteredProducts.where((element) => element.units > 0).toList();
      filteredProducts.sort((a, b) => b.id.compareTo(a.id));
      Future.delayed(const Duration(milliseconds: 1), () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Shop()));
      });
    }

    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Nav(),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            //Search Input
                            Expanded(
                                child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 10, right: 5, bottom: 10),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      _debouncer.run(() {
                                        setState(() {
                                          filteredProducts = products
                                              .where((product) => product.name
                                                  .toLowerCase()
                                                  .contains(val.toLowerCase()))
                                              .toList();
                                        });
                                        filteredProducts.sort(
                                            (a, b) => b.id.compareTo(a.id));
                                      });
                                    },
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      hintText: 'Find Something',
                                      hintStyle: const TextStyle(
                                          fontStyle: FontStyle.italic),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      prefixIcon: const Icon(
                                          FontAwesomeIcons.search,
                                          size: 25,
                                          color: Color(0xff303744)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                      //Shop items grid

                      ConstrainedBox(
                        constraints: BoxConstraints.expand(
                            height: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top -
                                MediaQuery.of(context).padding.bottom -
                                140),
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 20),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            childAspectRatio: 100 / 190,
                          ),
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            if (filteredProducts[index].discount > 0) {
                              return ShopProductItem(
                                  filteredProducts[index].id,
                                  '0_' + filteredProducts[index].name,
                                  filteredProducts[index].name,
                                  filteredProducts[index].description,
                                  ((filteredProducts[index].price -
                                                  filteredProducts[index]
                                                      .discount) *
                                              100)
                                          .round() /
                                      100,
                                  filteredProducts[index].price);
                            } else {
                              return ShopProductItem(
                                filteredProducts[index].id,
                                '0_' + filteredProducts[index].name,
                                filteredProducts[index].name,
                                filteredProducts[index].description,
                                filteredProducts[index].price,
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ))
                ],
              )),
        ));
  }
}
