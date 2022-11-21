import 'package:flutter/material.dart';
import 'package:mobile/models/product.dart';
import 'package:provider/provider.dart';

import 'homeProductItem.dart';

class SaleList extends StatefulWidget {
  const SaleList({Key? key}) : super(key: key);

  @override
  _SaleListState createState() => _SaleListState();
}

class _SaleListState extends State<SaleList> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context).where((element) => element.units > 0).toList();
    products.sort((a, b) => b.id.compareTo(a.id));

    if (products.where((element) => element.discount > 0).isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            if (products[index].discount > 0) {
              return HomeProductItem(
                  products[index].id,
                  '0_' + products[index].name,
                  products[index].name,
                  ((products[index].price - products[index].discount) * 100)
                      .round() /
                      100,
                  products[index].price);
            }
            return Container(
              height: 0,
              width: 0,
            );
          },
          scrollDirection: Axis.horizontal);
    } else {
      return Container();
    }
  }
}
