import 'package:flutter/material.dart';

class CartItem {
  final String menuItemId;
  final String name;
  final double price;
  int quantity;
  final String? imageUrl;

  CartItem({
    required this.menuItemId,
    required this.name,
    required this.price,
    this.quantity = 1,
    this.imageUrl,
  });

  double get total => price * quantity;
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];
  String? _restaurantId;
  String? _restaurantName;

  List<CartItem> get items => _items;
  String? get restaurantId => _restaurantId;
  String? get restaurantName => _restaurantName;
  
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  
  double get subtotal => _items.fold(
    0.0,
    (sum, item) => sum + item.total,
  );

  void addItem({
    required String menuItemId,
    required String name,
    required double price,
    required String restaurantId,
    required String restaurantName,
    String? imageUrl,
  }) {
    if (_restaurantId != null && _restaurantId != restaurantId) {
      _items.clear();
    }

    _restaurantId = restaurantId;
    _restaurantName = restaurantName;

    final existingIndex = _items.indexWhere(
      (item) => item.menuItemId == menuItemId,
    );

    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(
        CartItem(
          menuItemId: menuItemId,
          name: name,
          price: price,
          imageUrl: imageUrl,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(String menuItemId) {
    _items.removeWhere((item) => item.menuItemId == menuItemId);
    if (_items.isEmpty) {
      _restaurantId = null;
      _restaurantName = null;
    }
    notifyListeners();
  }

  void updateQuantity(String menuItemId, int quantity) {
    final index = _items.indexWhere(
      (item) => item.menuItemId == menuItemId,
    );
    
    if (index >= 0) {
      if (quantity <= 0) {
        removeItem(menuItemId);
      } else {
        _items[index].quantity = quantity;
        notifyListeners();
      }
    }
  }

  void clear() {
    _items.clear();
    _restaurantId = null;
    _restaurantName = null;
    notifyListeners();
  }
}
