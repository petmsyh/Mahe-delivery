import 'package:cloud_firestore/cloud_firestore.dart';

class OrderItemModel {
  final String menuItemId;
  final String name;
  final double price;
  final int quantity;
  final String? specialInstructions;

  OrderItemModel({
    required this.menuItemId,
    required this.name,
    required this.price,
    required this.quantity,
    this.specialInstructions,
  });

  Map<String, dynamic> toMap() {
    return {
      'menuItemId': menuItemId,
      'name': name,
      'price': price,
      'quantity': quantity,
      'specialInstructions': specialInstructions,
    };
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      menuItemId: map['menuItemId'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      quantity: map['quantity'] ?? 1,
      specialInstructions: map['specialInstructions'],
    );
  }

  double get totalPrice => price * quantity;
}

class OrderModel {
  final String id;
  final String customerId;
  final String restaurantId;
  final String restaurantName;
  final List<OrderItemModel> items;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final String status;
  final String? riderId;
  final String paymentMethod;
  final bool isPaid;
  final String deliveryAddress;
  final double deliveryLatitude;
  final double deliveryLongitude;
  final String? customerPhone;
  final String? specialInstructions;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deliveredAt;

  OrderModel({
    required this.id,
    required this.customerId,
    required this.restaurantId,
    required this.restaurantName,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.status,
    this.riderId,
    required this.paymentMethod,
    this.isPaid = false,
    required this.deliveryAddress,
    required this.deliveryLatitude,
    required this.deliveryLongitude,
    this.customerPhone,
    this.specialInstructions,
    required this.createdAt,
    this.updatedAt,
    this.deliveredAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'items': items.map((item) => item.toMap()).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'total': total,
      'status': status,
      'riderId': riderId,
      'paymentMethod': paymentMethod,
      'isPaid': isPaid,
      'deliveryAddress': deliveryAddress,
      'deliveryLatitude': deliveryLatitude,
      'deliveryLongitude': deliveryLongitude,
      'customerPhone': customerPhone,
      'specialInstructions': specialInstructions,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'deliveredAt': deliveredAt != null ? Timestamp.fromDate(deliveredAt!) : null,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      customerId: map['customerId'] ?? '',
      restaurantId: map['restaurantId'] ?? '',
      restaurantName: map['restaurantName'] ?? '',
      items: (map['items'] as List)
          .map((item) => OrderItemModel.fromMap(item))
          .toList(),
      subtotal: (map['subtotal'] ?? 0.0).toDouble(),
      deliveryFee: (map['deliveryFee'] ?? 0.0).toDouble(),
      total: (map['total'] ?? 0.0).toDouble(),
      status: map['status'] ?? '',
      riderId: map['riderId'],
      paymentMethod: map['paymentMethod'] ?? '',
      isPaid: map['isPaid'] ?? false,
      deliveryAddress: map['deliveryAddress'] ?? '',
      deliveryLatitude: (map['deliveryLatitude'] ?? 0.0).toDouble(),
      deliveryLongitude: (map['deliveryLongitude'] ?? 0.0).toDouble(),
      customerPhone: map['customerPhone'],
      specialInstructions: map['specialInstructions'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null 
          ? (map['updatedAt'] as Timestamp).toDate() 
          : null,
      deliveredAt: map['deliveredAt'] != null 
          ? (map['deliveredAt'] as Timestamp).toDate() 
          : null,
    );
  }
}
