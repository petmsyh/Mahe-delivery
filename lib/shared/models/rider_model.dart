import 'package:cloud_firestore/cloud_firestore.dart';

class RiderModel {
  final String id;
  final String userId;
  final String name;
  final String phoneNumber;
  final String? vehicleType;
  final String? vehicleNumber;
  final String? licenseNumber;
  final bool isVerified;
  final bool isAvailable;
  final bool isActive;
  final double rating;
  final int totalDeliveries;
  final double totalEarnings;
  final DateTime createdAt;
  final DateTime? verifiedAt;

  RiderModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.phoneNumber,
    this.vehicleType,
    this.vehicleNumber,
    this.licenseNumber,
    this.isVerified = false,
    this.isAvailable = true,
    this.isActive = true,
    this.rating = 0.0,
    this.totalDeliveries = 0,
    this.totalEarnings = 0.0,
    required this.createdAt,
    this.verifiedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'phoneNumber': phoneNumber,
      'vehicleType': vehicleType,
      'vehicleNumber': vehicleNumber,
      'licenseNumber': licenseNumber,
      'isVerified': isVerified,
      'isAvailable': isAvailable,
      'isActive': isActive,
      'rating': rating,
      'totalDeliveries': totalDeliveries,
      'totalEarnings': totalEarnings,
      'createdAt': Timestamp.fromDate(createdAt),
      'verifiedAt': verifiedAt != null 
          ? Timestamp.fromDate(verifiedAt!) 
          : null,
    };
  }

  factory RiderModel.fromMap(Map<String, dynamic> map) {
    return RiderModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      vehicleType: map['vehicleType'],
      vehicleNumber: map['vehicleNumber'],
      licenseNumber: map['licenseNumber'],
      isVerified: map['isVerified'] ?? false,
      isAvailable: map['isAvailable'] ?? true,
      isActive: map['isActive'] ?? true,
      rating: (map['rating'] ?? 0.0).toDouble(),
      totalDeliveries: map['totalDeliveries'] ?? 0,
      totalEarnings: (map['totalEarnings'] ?? 0.0).toDouble(),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      verifiedAt: map['verifiedAt'] != null 
          ? (map['verifiedAt'] as Timestamp).toDate() 
          : null,
    );
  }
}
