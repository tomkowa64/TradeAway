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
    final products = Provider.of<List<Product>>(context);

    return ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          if (products[index].discount > 0)
            return HomeProductItem(
                'assets/images/blender.png',
                products[index].name,
                ((products[index].price - products[index].discount) * 100)
                        .round() /
                    100,
                products[index].price);
          return Container(
            height: 0,
            width: 0,
          );
        },
        scrollDirection: Axis.horizontal);
    // return Container(
    //   padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
    //   color: const Color(0xffffffff),
    //   height: 300.0,
    //   child: ListView(
    //     shrinkWrap: true,
    //     children: [
    //       HomeProductItem('assets/images/backpack.png',
    //           'Backpack Adidas Premium', 69.99, 49.99),
    //       HomeProductItem('assets/images/blender.png',
    //           'Blender', 69.99, 49.99),
    //       HomeProductItem(
    //           'assets/images/sample-product.jpg',
    //           'Backpack Adidas Premium',
    //           69.99,
    //           49.99
    //       ),
    //     ],
    //     scrollDirection: Axis.horizontal
    //   ),
    // );
  }
}
