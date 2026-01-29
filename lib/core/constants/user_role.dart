enum UserRole {
  customer,
  vendor,
  rider,
  admin,
  superAdmin;

  String get displayName {
    switch (this) {
      case UserRole.customer:
        return 'Customer';
      case UserRole.vendor:
        return 'Vendor';
      case UserRole.rider:
        return 'Rider';
      case UserRole.admin:
        return 'Admin';
      case UserRole.superAdmin:
        return 'Super Admin';
    }
  }

  static UserRole fromString(String role) {
    switch (role.toLowerCase()) {
      case 'customer':
        return UserRole.customer;
      case 'vendor':
        return UserRole.vendor;
      case 'rider':
        return UserRole.rider;
      case 'admin':
        return UserRole.admin;
      case 'superadmin':
      case 'super_admin':
        return UserRole.superAdmin;
      default:
        return UserRole.customer;
    }
  }
}
