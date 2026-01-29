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
