import 'package:flutter/material.dart';
import '../../../core/constants/route_constants.dart';
import '../../../shared/widgets/stat_card.dart';

class VendorHomeScreen extends StatelessWidget {
  const VendorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, RouteConstants.vendorProfile);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: StatCard(
                  title: 'Today\'s Orders', value: '0', 
                  icon: Icons.shopping_bag, color: Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: StatCard(
                  title: 'Revenue', value: '\$0', 
                  icon: Icons.attach_money, color: Colors.green)),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Icon(Icons.restaurant_menu, size: 32),
                title: const Text('Menu Management'),
                subtitle: const Text('Manage your menu items'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, RouteConstants.menuManagement);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.list_alt, size: 32),
                title: const Text('Orders'),
                subtitle: const Text('View and manage orders'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, RouteConstants.vendorOrders);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.bar_chart, size: 32),
                title: const Text('Reports'),
                subtitle: const Text('View sales reports'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, RouteConstants.vendorReports);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
