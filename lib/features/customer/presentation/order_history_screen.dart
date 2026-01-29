import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/models/order_model.dart';
import '../../../core/services/order_service.dart';
import '../../../shared/providers/auth_provider.dart';
import '../../../shared/widgets/order_card.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderService = OrderService();
    final userId = context.read<AuthProvider>().currentUser?.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: userId == null
          ? const Center(child: Text('Please login to view orders'))
          : StreamBuilder<List<OrderModel>>(
              stream: orderService.getCustomerOrders(userId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final orders = snapshot.data ?? [];

                if (orders.isEmpty) {
                  return const Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.receipt_long, size: 100, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('No orders yet', 
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    ],
                  ));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return OrderCard(order: orders[index]);
                  },
                );
              },
            ),
    );
  }
}
