import 'package:flutter/material.dart';

class DeliverySettingsCard extends StatelessWidget {
  final TextEditingController deliveryFeeController;
  final TextEditingController minOrderController;

  const DeliverySettingsCard({
    super.key,
    required this.deliveryFeeController,
    required this.minOrderController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivery Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: deliveryFeeController,
              decoration: const InputDecoration(
                labelText: 'Default Delivery Fee (\$)',
                prefixIcon: Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: minOrderController,
              decoration: const InputDecoration(
                labelText: 'Minimum Order Amount (\$)',
                prefixIcon: Icon(Icons.shopping_bag),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
