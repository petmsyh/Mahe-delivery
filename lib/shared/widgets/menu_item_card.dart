import 'package:flutter/material.dart';
import '../models/menu_item_model.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItemModel menuItem;

  const MenuItemCard({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            menuItem.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 60,
                height: 60,
                color: Colors.grey[300],
                child: const Icon(Icons.restaurant),
              );
            },
          ),
        ),
        title: Text(menuItem.name),
        subtitle: Text('\$${menuItem.price.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: menuItem.isAvailable,
              onChanged: (value) {
                // Toggle availability
              },
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  // Edit menu item
                } else if (value == 'delete') {
                  // Delete menu item
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
