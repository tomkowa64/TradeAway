import 'package:flutter_cart/flutter_cart.dart';
import 'package:mobile/models/transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({ this.uid });

  // collection references
  final CollectionReference productCollection = FirebaseFirestore.instance.collection('products');
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference transactionCollection = FirebaseFirestore.instance.collection('transactions');
  final CollectionReference cartCollection = FirebaseFirestore.instance.collection('carts');

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

  // update transaction data
  Future updateTransactionData(int id, String productId, String sellerId, String? clientId, num price, num quantity, String status, Timestamp date) async {
    return await transactionCollection.doc(id.toString()).set({
      'productId': productId,
      'seller': sellerId,
      'client': clientId,
      'price': price,
      'quantity': quantity,
      'status': status,
      'date': date
    });
  }

  // transaction list from snapshot
  List<OurTransaction> _transactionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return OurTransaction(
        transactionId: int.parse(doc.id),
        productId: data['productId'] ?? '',
        sellerId: data['sellerId'] ?? '',
        clientId: data['clientId'] ?? '',
        price: data['price'] ?? 0,
        quantity: data['quantity'] ?? 0,
        status: data['status'] ?? '',
        date: data['date'] ?? ''
      );
    }).toList();
  }

  // get transaction stream
  Stream<List<OurTransaction>> get transaction {
    return transactionCollection.snapshots().map(_transactionListFromSnapshot);
  }

  // update cart data
  Future updateCartData(FlutterCart cart) async {
    // await cartCollection.doc(uid.toString()).delete();

    Map<String, int> cartMap = {};
    for (var item in cart.cartItem.toList()) {
      cartMap[item.productId.toString()] = item.quantity;
    }

    return await cartCollection.doc(uid.toString()).set({
      'cart': cartMap
    });
  }

  // clear cart
  Future deleteCartData() async {
    await cartCollection.doc(uid.toString()).delete();
  }

  // transaction list from snapshot
  List<Map<String, dynamic>> _cartListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      Map<String, dynamic> cartMap = {};
      cartMap['uid'] = doc.id;
      cartMap.addAll(data);
      return cartMap;
    }).toList();
  }

  // get transaction stream
  Stream<List<Map<String, dynamic>>> get cart {
    return cartCollection.snapshots().map(_cartListFromSnapshot);
  }
}