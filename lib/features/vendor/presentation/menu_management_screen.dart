import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/models/menu_item_model.dart';
import '../../../core/services/restaurant_service.dart';
import '../../../shared/providers/auth_provider.dart';
import '../../../shared/widgets/menu_item_card.dart';
import '../../../shared/widgets/add_menu_item_dialog.dart';

class MenuManagementScreen extends StatelessWidget {
  const MenuManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantService = RestaurantService();
    final userId = context.read<AuthProvider>().currentUser?.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Management'),
      ),
      body: userId == null
          ? const Center(child: Text('Please login'))
          : StreamBuilder<List<MenuItemModel>>(
              stream: restaurantService.getMenuItems(userId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final menuItems = snapshot.data ?? [];

                if (menuItems.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.restaurant_menu,
                          size: 100,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No menu items yet',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    return MenuItemCard(menuItem: menuItems[index]);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddMenuItemDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddMenuItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddMenuItemDialog(),
    );
  }
}
