import 'package:flutter/material.dart';

class RiderStatusCard extends StatelessWidget {
  final bool isOnline;
  final ValueChanged<bool> onStatusChanged;

  const RiderStatusCard({
    super.key,
    required this.isOnline,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Status', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 12, height: 12,
                      decoration: BoxDecoration(
                        color: isOnline ? Colors.green : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(isOnline ? 'Online' : 'Offline',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            Switch(value: isOnline, onChanged: onStatusChanged),
          ],
        ),
      ),
    );
  }
}
