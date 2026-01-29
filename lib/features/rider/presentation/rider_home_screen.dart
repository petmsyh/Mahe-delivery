import 'package:flutter/material.dart';
import '../../../core/constants/route_constants.dart';
import '../../../shared/widgets/stat_card.dart';
import '../../../shared/widgets/rider_status_card.dart';

class RiderHomeScreen extends StatelessWidget {
  const RiderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rider Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, RouteConstants.riderProfile);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RiderStatusCard(isOnline: true, onStatusChanged: (value) {}),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: StatCard('Today\'s Deliveries', '0', 
                  Icons.delivery_dining, Colors.orange)),
                const SizedBox(width: 12),
                Expanded(child: StatCard('Earnings', '\$0', 
                  Icons.attach_money, Colors.orange)),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Available Deliveries',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: Center(
                child: Text('No available deliveries',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Deliveries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Earnings',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, RouteConstants.riderDeliveries);
          } else if (index == 2) {
            Navigator.pushNamed(context, RouteConstants.riderEarnings);
          }
        },
      ),
    );
  }
}
