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
        if(products[products.length - 1 - index].discount > 0) {
          return ShopProductItem(
              products.length - 1 - index,
              '0_' + products[products.length - 1 - index].name,
              products[products.length - 1 - index].name,
              products[products.length - 1 - index].description,
              ((products[products.length - 1 - index].price - products[products.length - 1 - index].discount) * 100).round() /
                  100,
              false,
              products[products.length - 1 - index].price);
        } else {
          return ShopProductItem(
              products.length - 1 - index,
              '0_' + products[products.length - 1 - index].name,
              products[products.length - 1 - index].name,
              products[products.length - 1 - index].description,
              products[products.length - 1 - index].price,
              false
          );
        }
      },
    );
  }
}
