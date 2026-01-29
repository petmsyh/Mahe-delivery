import 'package:flutter/material.dart';
import '../../../core/constants/route_constants.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildAdminCard(
              'Users',
              Icons.people,
              Colors.blue,
              () => Navigator.pushNamed(context, RouteConstants.adminUsers),
            ),
            _buildAdminCard(
              'Vendors',
              Icons.store,
              Colors.green,
              () => Navigator.pushNamed(context, RouteConstants.adminVendors),
            ),
            _buildAdminCard(
              'Riders',
              Icons.delivery_dining,
              Colors.orange,
              () => Navigator.pushNamed(context, RouteConstants.adminRiders),
            ),
            _buildAdminCard(
              'Orders',
              Icons.shopping_bag,
              Colors.purple,
              () => Navigator.pushNamed(context, RouteConstants.adminOrders),
            ),
            _buildAdminCard(
              'Configuration',
              Icons.settings,
              Colors.grey,
              () => Navigator.pushNamed(context, RouteConstants.adminConfig),
            ),
            _buildAdminCard(
              'Reports',
              Icons.bar_chart,
              Colors.teal,
              () => Navigator.pushNamed(context, RouteConstants.adminReports),
            ),
            _buildAdminCard(
              'Complaints',
              Icons.report_problem,
              Colors.red,
              () => Navigator.pushNamed(context, RouteConstants.adminComplaints),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
