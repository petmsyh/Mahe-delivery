import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String vendorId;
  final double rating;
  final int totalRatings;
  final String address;
  final double latitude;
  final double longitude;
  final bool isActive;
  final bool isApproved;
  final List<String> categories;
  final String? phoneNumber;
  final double deliveryFee;
  final int estimatedDeliveryTime;
  final DateTime createdAt;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.vendorId,
    this.rating = 0.0,
    this.totalRatings = 0,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.isActive = true,
    this.isApproved = false,
    required this.categories,
    this.phoneNumber,
    this.deliveryFee = 0.0,
    this.estimatedDeliveryTime = 30,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'vendorId': vendorId,
      'rating': rating,
      'totalRatings': totalRatings,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'isActive': isActive,
      'isApproved': isApproved,
      'categories': categories,
      'phoneNumber': phoneNumber,
      'deliveryFee': deliveryFee,
      'estimatedDeliveryTime': estimatedDeliveryTime,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      vendorId: map['vendorId'] ?? '',
      rating: (map['rating'] ?? 0.0).toDouble(),
      totalRatings: map['totalRatings'] ?? 0,
      address: map['address'] ?? '',
      latitude: (map['latitude'] ?? 0.0).toDouble(),
      longitude: (map['longitude'] ?? 0.0).toDouble(),
      isActive: map['isActive'] ?? true,
      isApproved: map['isApproved'] ?? false,
      categories: List<String>.from(map['categories'] ?? []),
      phoneNumber: map['phoneNumber'],
      deliveryFee: (map['deliveryFee'] ?? 0.0).toDouble(),
      estimatedDeliveryTime: map['estimatedDeliveryTime'] ?? 30,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}
