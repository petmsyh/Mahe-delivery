import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final IconData icon;

  const CategoryCard({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.orange),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
