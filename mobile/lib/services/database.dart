import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/product.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({ this.uid });

  // collection references
  final CollectionReference productCollection = FirebaseFirestore.instance.collection('products');

  // update product data
  Future updateProductData(int id, String name, String description, double price, double discount, int category, int units) async {
    return await productCollection.doc(id.toString()).set({
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'seller': uid,
      'category': category,
      'units': units
    });
  }

  // product list from snapshot
  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return Product(
        id: int.parse(doc.id.toString()),
        name: data['name'] ?? '',
        description: data['description'] ?? '',
        price: data['price'] ?? 0.0,
        discount: data['discount'] ?? 0.0,
        seller: data['seller'] ?? '',
        category: data['category'] ?? 0,
        units: data['units'] ?? 0
      );
    }).toList();
  }

  // get product stream
  Stream<List<Product>> get products {
    return productCollection.snapshots().map(_productListFromSnapshot);
  }
}