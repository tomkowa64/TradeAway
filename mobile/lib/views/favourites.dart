import 'dart:ui';

//Components
import 'package:mobile/components/shopProductItem.dart';
import 'package:mobile/inc/navigationDrawer.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/services/database.dart';
import 'package:mobile/services/storage.dart';
import 'package:provider/provider.dart';

//Included widgets
import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);
  static List<Product> filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AppUser>(context);
    final DatabaseService database = DatabaseService(uid: auth.uid);
    final products = Provider.of<List<Product>>(context);
    final Storage storage = Storage();
    final favorites = Provider.of<List<Map<String, dynamic>>>(context);

    var favoriteArray = [];

    if(favorites.where((element) => element.values.toList()[0] == auth.uid).isNotEmpty) {
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
          if(element.isNotEmpty) {
            favoriteArray.add(element.trim());
          }
        });
      }

      if(favoriteArray.isNotEmpty) {
        filteredProducts = products
            .where((element) => element.units > 0)
            .where((element) => favoriteArray.contains(element.id.toString()))
            .toList();
        filteredProducts.sort((a, b) => b.id.compareTo(a.id));

        if (filteredProducts.isEmpty) {
          Future.delayed(const Duration(milliseconds: 1), () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Favourites()));
          });
        }
      }
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
                      //Favourites items grid
                      ConstrainedBox(
                        constraints: BoxConstraints.expand(
                            height: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.bottom -
                                60),
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
