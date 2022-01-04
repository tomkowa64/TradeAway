import 'package:flutter/material.dart';
import 'package:mobile/components/homeProductItem.dart';
import 'package:mobile/components/shopProductItem.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/services/storage.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    // final Storage storage = Storage();

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        childAspectRatio: 100 / 190,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        if(products[index].discount > 0) {
          return ShopProductItem(
              index,
              '0_' + products[index].name,
              products[index].name,
              products[index].description,
              ((products[index].price - products[index].discount) * 100).round() /
                  100,
              false,
              products[index].price);
        } else {
          return ShopProductItem(
              index,
              '0_' + products[index].name,
              products[index].name,
              products[index].description,
              products[index].price,
              false
          );
        }
      },
    );
  }
}
