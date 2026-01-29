import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel {
  final String id;
  final String orderId;
  final String customerId;
  final double amount;
  final String method;
  final String status;
  final String? transactionId;
  final String? paymentProvider;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime? completedAt;

  PaymentModel({
    required this.id,
    required this.orderId,
    required this.customerId,
    required this.amount,
    required this.method,
    required this.status,
    this.transactionId,
    this.paymentProvider,
    this.metadata,
    required this.createdAt,
    this.completedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orderId': orderId,
      'customerId': customerId,
      'amount': amount,
      'method': method,
      'status': status,
      'transactionId': transactionId,
      'paymentProvider': paymentProvider,
      'metadata': metadata,
      'createdAt': Timestamp.fromDate(createdAt),
      'completedAt': completedAt != null 
          ? Timestamp.fromDate(completedAt!) 
          : null,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      id: map['id'] ?? '',
      orderId: map['orderId'] ?? '',
      customerId: map['customerId'] ?? '',
      amount: (map['amount'] ?? 0.0).toDouble(),
      method: map['method'] ?? '',
      status: map['status'] ?? '',
      transactionId: map['transactionId'],
      paymentProvider: map['paymentProvider'],
      metadata: map['metadata'] != null 
          ? Map<String, dynamic>.from(map['metadata']) 
          : null,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      completedAt: map['completedAt'] != null 
          ? (map['completedAt'] as Timestamp).toDate() 
          : null,
    );
  }

  bool get isPending => status == 'pending';
  bool get isCompleted => status == 'completed';
  bool get isFailed => status == 'failed';
  bool get isCancelled => status == 'cancelled';
}
