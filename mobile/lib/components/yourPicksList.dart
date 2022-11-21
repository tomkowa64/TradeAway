import 'package:flutter/material.dart';
import 'package:mobile/models/category.dart';
import 'package:mobile/models/product.dart';
import 'package:provider/provider.dart';

import '../models/appUser.dart';
import '../models/transaction.dart';
import 'homeProductItem.dart';

class YourPicksList extends StatefulWidget {
  const YourPicksList({Key? key}) : super(key: key);

  @override
  _YourPicksListState createState() => _YourPicksListState();
}

class _YourPicksListState extends State<YourPicksList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    final categories = Provider.of<List<OurCategory>>(context);
    final transactions = Provider.of<List<OurTransaction>>(context).where((element) => element.clientId == user?.uid);
    final allProducts = Provider.of<List<Product>>(context);
    final products = <Product>[];

    List<int> categoriesCount = <int>[];

    for (int i = 0; i < categories.length; i++) {
      categoriesCount.add(0);
    }

    for (var transaction in transactions) {
      if (allProducts.firstWhere((element) => element.id.toString() == transaction.productId).categories.isNotEmpty) {
        for (var category in allProducts.firstWhere((element) => element.id.toString() == transaction.productId).categories) {
          categoriesCount[category]++;
        }
      }
    }

    int max, maxIndex;

    for (int i = 0; i < categoriesCount.length; i++) {
      max = 0;
      maxIndex = 0;

      for (int j = 0; j < categoriesCount.length; j++) {
        if (categoriesCount[j] > max) {
          max = categoriesCount[j];
          maxIndex = j;
        }
      }

      if (max == 0) {
        break;
      }
      
      categoriesCount[maxIndex] = 0;

      if (products.length < 20) {
        products.addAll(allProducts.where((element) => element.categories.contains(maxIndex) && element.units > 0));
      } else {
        break;
      }
    }

    return ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          if (products[index].discount > 0)
            return HomeProductItem(
                products[index].id,
                '0_' + products[index].name,
                products[index].name,
                ((products[index].price - products[index].discount) * 100)
                        .round() /
                    100,
                products[index].price);
          return HomeProductItem(products[index].id, '0_' + products[index].name,
              products[index].name, products[index].price);
        },
        scrollDirection: Axis.horizontal);
  }
}
