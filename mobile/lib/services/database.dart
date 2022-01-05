import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({ this.uid });

  // collection references
  final CollectionReference productCollection = FirebaseFirestore.instance.collection('products');
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  // update product data
  Future updateProductData(int id, String name, String description, double price, double discount, int category, int units, String state) async {
    return await productCollection.doc(id.toString()).set({
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'seller': uid,
      'category': category,
      'units': units,
      'state': state
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
        units: data['units'] ?? 0,
        state: data['state'] ?? ''
      );
    }).toList();
  }

  // get product stream
  Stream<List<Product>> get products {
    return productCollection.snapshots().map(_productListFromSnapshot);
  }

  // user list from snapshot
  List<OurUser> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return OurUser(
          uid: doc.id.toString(),
          name: data['name'] ?? '',
          surname: data['surname'] ?? '',
      );
    }).toList();
  }

  // get user stream
  Stream<List<OurUser>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}