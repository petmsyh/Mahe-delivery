class AppConstants {
  // App Info
  static const String appName = 'Mahe Delivery';
  static const String appVersion = '1.0.0';
  
  // API & Network
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
  
  // Pagination
  static const int itemsPerPage = 20;
  
  // Map
  static const double defaultZoom = 15.0;
  static const double defaultLatitude = 9.0320;
  static const double defaultLongitude = 38.7469;
  
  // Order Status
  static const String orderPlaced = 'placed';
  static const String orderAccepted = 'accepted';
  static const String orderPreparing = 'preparing';
  static const String orderReady = 'ready';
  static const String orderPickedUp = 'picked_up';
  static const String orderDelivered = 'delivered';
  static const String orderCancelled = 'cancelled';
  
  // Payment Methods
  static const String cashOnDelivery = 'cash';
  static const String telebirr = 'telebirr';
  static const String chapa = 'chapa';
}
