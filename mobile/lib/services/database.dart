import 'package:flutter_cart/flutter_cart.dart';
import 'package:mobile/models/transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collection references
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection('transactions');
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('carts');
  final CollectionReference favoriteCollection =
      FirebaseFirestore.instance.collection('favorites');

  // update product data
  Future updateProductData(
      int id,
      String name,
      String description,
      double price,
      double discount,
      String sellerId,
      List<int> categories,
      int units,
      String state) async {
    return await productCollection.doc(id.toString()).set({
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'seller': sellerId,
      'categories': categories,
      'units': units,
      'state': state
    });
  }

  // update favorites data
  Future updateFavoriteData(num newFavoriteProductId) async {
    await FirebaseFirestore.instance
        .collection("favorites")
        .doc(uid)
        .get()
        .then((value) async {
          if(value.data() == null) {
            await favoriteCollection.doc(uid).set({'productList': []});
          }
    });
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
          categories: data['categories'] ?? [],
          units: data['units'] ?? 0,
          state: data['state'] ?? '');
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

  // update user data
  Future updateUserData(
      String id,
      String name,
      String surname,
      int age,
      num phone,
      String country,
      String city,
      String postalCode,
      String address) async {
    return await userCollection.doc(id).set({
      'name': name,
      'surname': surname,
      'age': age,
      'phone': phone,
      'country': country,
      'city': city,
      'postalCode': postalCode,
      'address': address
    });
  }

  // user list from snapshot
  List<OurUser> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return OurUser(
          uid: doc.id.toString(),
          name: data['name'] ?? '',
          surname: data['surname'] ?? '',
          age: data['age'] ?? 0,
          phone: data['phone'] ?? 0,
          country: data['country'] ?? '',
          city: data['city'] ?? '',
          postalCode: data['postalCode'] ?? '',
          address: data['address'] ?? '');
    }).toList();
  }

  // get user stream
  Stream<List<OurUser>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  // update transaction data
  Future updateTransactionData(
      int id,
      String productId,
      String sellerId,
      String? clientId,
      num price,
      num quantity,
      String status,
      Timestamp date) async {
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
          sellerId: data['seller'] ?? '',
          clientId: data['client'] ?? '',
          price: data['price'] ?? 0,
          quantity: data['quantity'] ?? 0,
          status: data['status'] ?? '',
          date: data['date'] ?? '');
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

    return await cartCollection.doc(uid.toString()).set({'cart': cartMap});
  }

  // clear cart
  Future deleteCartData() async {
    await cartCollection.doc(uid.toString()).delete();
  }

  // transaction list from snapshot
  Map<String, dynamic> _cartListFromSnapshot(QuerySnapshot snapshot) {
    var carts = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      Map<String, dynamic> cartMap = {};
      cartMap['uid'] = doc.id;
      cartMap.addAll(data);
      return cartMap;
    }).toList();

    return carts.firstWhere((element) => element[0] == uid);
  }

  // transaction list from snapshot
  List<Map<String, dynamic>> _favoriteListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      Map<String, dynamic> favoriteMap = {};
      favoriteMap['uid'] = doc.id;
      favoriteMap.addAll(data);
      return favoriteMap;
    }).toList();
  }

  // get transaction stream
  Stream<Map<String, dynamic>> get cart {
    return cartCollection.snapshots().map(_cartListFromSnapshot);
  }

  // get favorite stream
  Stream<List<Map<String, dynamic>>> get favorites {
    return favoriteCollection.snapshots().map(_favoriteListFromSnapshot);
  }
}
