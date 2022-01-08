import 'package:cloud_firestore/cloud_firestore.dart';

class OurTransaction {
  final String productId;
  final String sellerId;
  final String clientId;
  final num price;
  final String status;
  final Timestamp date;

  OurTransaction({
    required this.productId,
    required this.sellerId,
    required this.clientId,
    required this.price,
    required this.status,
    required this.date
  });
}