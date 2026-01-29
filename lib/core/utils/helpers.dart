class CurrencyHelper {
  static String formatCurrency(double amount, {String symbol = '\$'}) {
    return '$symbol${amount.toStringAsFixed(2)}';
  }

  static String formatPrice(double price) {
    return formatCurrency(price);
  }

  static double calculateSubtotal(List<dynamic> items) {
    return items.fold(0.0, (sum, item) {
      if (item is Map && item.containsKey('price') && item.containsKey('quantity')) {
        return sum + (item['price'] * item['quantity']);
      }
      return sum;
    });
  }

  static double calculateTotal({
    required double subtotal,
    required double deliveryFee,
    double tax = 0.0,
    double discount = 0.0,
  }) {
    return subtotal + deliveryFee + tax - discount;
  }

  static String formatPercentage(double value) {
    return '${(value * 100).toStringAsFixed(0)}%';
  }
}

class DistanceHelper {
  static double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371; // km

    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);

    final a = (dLat / 2).sin() * (dLat / 2).sin() +
        _degreesToRadians(lat1).cos() *
            _degreesToRadians(lat2).cos() *
            (dLon / 2).sin() *
            (dLon / 2).sin();

    final c = 2 * (a.sqrt().asin());
    return earthRadius * c;
  }

  static double _degreesToRadians(double degrees) {
    return degrees * (3.141592653589793 / 180);
  }

  static String formatDistance(double kilometers) {
    if (kilometers < 1) {
      return '${(kilometers * 1000).toStringAsFixed(0)} m';
    }
    return '${kilometers.toStringAsFixed(1)} km';
  }
}
