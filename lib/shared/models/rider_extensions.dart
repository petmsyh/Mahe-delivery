import 'rider_model.dart';

extension RiderModelExtensions on RiderModel {
  RiderModel copyWith({
    String? id,
    String? userId,
    String? name,
    String? phoneNumber,
    String? vehicleType,
    String? vehicleNumber,
    String? licenseNumber,
    bool? isVerified,
    bool? isAvailable,
    bool? isActive,
    double? rating,
    int? totalDeliveries,
    double? totalEarnings,
    DateTime? createdAt,
    DateTime? verifiedAt,
  }) {
    return RiderModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      vehicleType: vehicleType ?? this.vehicleType,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      isVerified: isVerified ?? this.isVerified,
      isAvailable: isAvailable ?? this.isAvailable,
      isActive: isActive ?? this.isActive,
      rating: rating ?? this.rating,
      totalDeliveries: totalDeliveries ?? this.totalDeliveries,
      totalEarnings: totalEarnings ?? this.totalEarnings,
      createdAt: createdAt ?? this.createdAt,
      verifiedAt: verifiedAt ?? this.verifiedAt,
    );
  }
}
