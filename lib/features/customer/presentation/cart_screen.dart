import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/providers/cart_provider.dart';
import '../../../core/constants/route_constants.dart';
import '../../../shared/widgets/cart_item_card.dart';
import '../../../shared/widgets/cart_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey),
                SizedBox(height: 16),
                Text('Your cart is empty',
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) => CartItemCard(item: cart.items[index]),
                ),
              ),
              CartSummary(
                subtotal: cart.subtotal,
                onCheckout: () => Navigator.pushNamed(context, RouteConstants.checkout),
              ),
            ],
          );
        },
      ),
    );
  }
}
