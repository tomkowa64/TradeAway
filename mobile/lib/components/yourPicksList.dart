import 'package:flutter/material.dart';
import 'package:mobile/models/product.dart';
import 'package:provider/provider.dart';

import 'homeProductItem.dart';

class YourPicksList extends StatefulWidget {
  const YourPicksList({Key? key}) : super(key: key);

  @override
  _YourPicksListState createState() => _YourPicksListState();
}

class _YourPicksListState extends State<YourPicksList> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context).where((element) => element.units > 0).toList();
    products.sort((a, b) => a.id.compareTo(b.id));

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
