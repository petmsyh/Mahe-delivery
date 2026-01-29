import 'package:flutter/material.dart';
import 'delivery_settings_card.dart';
import 'config_menu_card.dart';

class ConfigScreenBody extends StatelessWidget {
  final TextEditingController deliveryFeeController;
  final TextEditingController minOrderController;
  final bool isLoading;
  final VoidCallback onSave;

  const ConfigScreenBody({
    super.key,
    required this.deliveryFeeController,
    required this.minOrderController,
    required this.isLoading,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DeliverySettingsCard(
          deliveryFeeController: deliveryFeeController,
          minOrderController: minOrderController,
        ),
        const SizedBox(height: 16),
        ConfigMenuCard(
          icon: Icons.location_on,
          title: 'Service Areas',
          subtitle: 'Manage delivery service areas',
          onTap: () {},
        ),
        ConfigMenuCard(
          icon: Icons.schedule,
          title: 'Operating Hours',
          subtitle: 'Set restaurant operating hours',
          onTap: () {},
        ),
        ConfigMenuCard(
          icon: Icons.category,
          title: 'Categories',
          subtitle: 'Manage food categories',
          onTap: () {},
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading ? null : onSave,
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save Configuration'),
          ),
        ),
      ],
    );
  }
}
