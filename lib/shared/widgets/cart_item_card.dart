import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../providers/cart_provider.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: item.imageUrl != null
                  ? Image.network(item.imageUrl!, width: 60, height: 60, 
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => 
                        _placeholderImage())
                  : _placeholderImage(),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  Text('\$${item.price.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => context.read<CartProvider>().updateQuantity(
                    item.menuItemId, item.quantity - 1)),
                Text('${item.quantity}', style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => context.read<CartProvider>().updateQuantity(
                    item.menuItemId, item.quantity + 1)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholderImage() {
    return Container(
      width: 60, height: 60,
      color: Colors.grey[300],
      child: const Icon(Icons.restaurant),
    );
  }
}
