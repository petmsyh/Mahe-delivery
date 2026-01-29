import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/user_role.dart';

class UserModel {
  final String id;
  final String phoneNumber;
  final String? email;
  final String? name;
  final UserRole role;
  final String? profileImageUrl;
  final bool isActive;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime? updatedAt;

  UserModel({
    required this.id,
    required this.phoneNumber,
    this.email,
    this.name,
    required this.role,
    this.profileImageUrl,
    this.isActive = true,
    this.isVerified = false,
    required this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'email': email,
      'name': name,
      'role': role.name,
      'profileImageUrl': profileImageUrl,
      'isActive': isActive,
      'isVerified': isVerified,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'],
      name: map['name'],
      role: UserRole.fromString(map['role'] ?? 'customer'),
      profileImageUrl: map['profileImageUrl'],
      isActive: map['isActive'] ?? true,
      isVerified: map['isVerified'] ?? false,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null 
          ? (map['updatedAt'] as Timestamp).toDate() 
          : null,
    );
  }

  UserModel copyWith({
    String? id,
    String? phoneNumber,
    String? email,
    String? name,
    UserRole? role,
    String? profileImageUrl,
    bool? isActive,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      isActive: isActive ?? this.isActive,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
