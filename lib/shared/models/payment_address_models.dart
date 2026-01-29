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

class AddressModel {
  final String id;
  final String userId;
  final String label;
  final String address;
  final double latitude;
  final double longitude;
  final String? building;
  final String? floor;
  final String? apartment;
  final String? landmark;
  final bool isDefault;
  final DateTime createdAt;

  AddressModel({
    required this.id,
    required this.userId,
    required this.label,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.building,
    this.floor,
    this.apartment,
    this.landmark,
    this.isDefault = false,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'label': label,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'building': building,
      'floor': floor,
      'apartment': apartment,
      'landmark': landmark,
      'isDefault': isDefault,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      label: map['label'] ?? '',
      address: map['address'] ?? '',
      latitude: (map['latitude'] ?? 0.0).toDouble(),
      longitude: (map['longitude'] ?? 0.0).toDouble(),
      building: map['building'],
      floor: map['floor'],
      apartment: map['apartment'],
      landmark: map['landmark'],
      isDefault: map['isDefault'] ?? false,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}
