import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/product.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collection references
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  // collection references
  final CollectionReference favoriteCollection =
      FirebaseFirestore.instance.collection('favorites');

  // update product data
  Future updateProductData(int id, String name, String description,
      double price, double discount, int category, int units) async {
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

  //
  // update favorites data
  Future updateFavoriteData(num newFavoriteProductId) async {
    var items = [];
    await FirebaseFirestore.instance
        .collection("favorites")
        .doc(uid)
        .get()
        .then((value) async {
      List.from(value.data()!['productList']).forEach((element) {
        items.add(element);
      });
      if (items.contains(newFavoriteProductId)) {
        return await favoriteCollection.doc(uid).update({
          'productList': FieldValue.arrayRemove([newFavoriteProductId])
        });
      } else {
        return await favoriteCollection.doc(uid).update({
          'productList': FieldValue.arrayUnion([newFavoriteProductId])
        });
      }
    });
  }

  // product list from snapshot
  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return Product(
          id: int.parse(doc.id.toString()),
          name: data['name'] ?? '',
          description: data['description'] ?? '',
          price: data['price'] ?? 0.0,
          discount: data['discount'] ?? 0.0,
          seller: data['seller'] ?? '',
          category: data['category'] ?? 0,
          units: data['units'] ?? 0);
    }).toList();
  }

  // favorite products id list
  Future<bool> isFavorite(productId) async {
    var items = [];
    return await FirebaseFirestore.instance
        .collection("favorites")
        .doc(uid)
        .get()
        .then((value) {
      List.from(value.data()!['productList']).forEach((element) {
        items.add(element);
      });
      return items.contains(productId);
    });
  }

  // get product stream
  Stream<List<Product>> get products {
    return productCollection.snapshots().map(_productListFromSnapshot);
  }
}
