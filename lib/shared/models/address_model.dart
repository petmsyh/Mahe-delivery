import 'package:cloud_firestore/cloud_firestore.dart';

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
