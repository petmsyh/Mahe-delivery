class RouteConstants {
  // Auth Routes
  static const String splash = '/';
  static const String login = '/login';
  static const String phoneAuth = '/phone-auth';
  static const String otpVerification = '/otp-verification';
  
  // Customer Routes
  static const String customerHome = '/customer/home';
  static const String restaurantList = '/customer/restaurants';
  static const String restaurantDetail = '/customer/restaurant-detail';
  static const String cart = '/customer/cart';
  static const String checkout = '/customer/checkout';
  static const String orderTracking = '/customer/order-tracking';
  static const String orderHistory = '/customer/order-history';
  static const String customerProfile = '/customer/profile';
  
  // Vendor Routes
  static const String vendorHome = '/vendor/home';
  static const String vendorOrders = '/vendor/orders';
  static const String menuManagement = '/vendor/menu';
  static const String vendorReports = '/vendor/reports';
  static const String vendorProfile = '/vendor/profile';
  
  // Rider Routes
  static const String riderHome = '/rider/home';
  static const String riderDeliveries = '/rider/deliveries';
  static const String riderEarnings = '/rider/earnings';
  static const String riderProfile = '/rider/profile';
  
  // Admin Routes
  static const String adminHome = '/admin/home';
  static const String adminUsers = '/admin/users';
  static const String adminVendors = '/admin/vendors';
  static const String adminRiders = '/admin/riders';
  static const String adminOrders = '/admin/orders';
  static const String adminConfig = '/admin/config';
  static const String adminReports = '/admin/reports';
  static const String adminComplaints = '/admin/complaints';
}
