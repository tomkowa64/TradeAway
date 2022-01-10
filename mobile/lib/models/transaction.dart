import 'package:cloud_firestore/cloud_firestore.dart';

class OurTransaction {
  final int transactionId;
  final String productId;
  final String sellerId;
  final String clientId;
  final num price;
  final num quantity;
  final String status;
  final Timestamp date;

  OurTransaction({
    required this.transactionId,
    required this.productId,
    required this.sellerId,
    required this.clientId,
    required this.price,
    required this.quantity,
    required this.status,
    required this.date
  });
}