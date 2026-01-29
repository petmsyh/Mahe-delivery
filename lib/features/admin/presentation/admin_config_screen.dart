import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/constants/firebase_constants.dart';
import '../../../shared/widgets/delivery_settings_card.dart';
import '../../../shared/widgets/config_menu_card.dart';

class AdminConfigScreen extends StatefulWidget {
  const AdminConfigScreen({super.key});

  @override
  State<AdminConfigScreen> createState() => _AdminConfigScreenState();
}

class _AdminConfigScreenState extends State<AdminConfigScreen> {
  final _deliveryFeeController = TextEditingController();
  final _minOrderController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  Future<void> _loadConfig() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection(FirebaseConstants.configCollection)
          .doc('app_config')
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        _deliveryFeeController.text = 
            (data['deliveryFee'] ?? 0).toString();
        _minOrderController.text = 
            (data['minimumOrder'] ?? 0).toString();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading config: $e')),
        );
      }
    }
  }

  Future<void> _saveConfig() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.configCollection)
          .doc('app_config')
          .set({
        'deliveryFee': double.parse(_deliveryFeeController.text),
        'minimumOrder': double.parse(_minOrderController.text),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Configuration saved')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving config: $e')),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DeliverySettingsCard(
            deliveryFeeController: _deliveryFeeController,
            minOrderController: _minOrderController,
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
              onPressed: _isLoading ? null : _saveConfig,
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save Configuration'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _deliveryFeeController.dispose();
    _minOrderController.dispose();
    super.dispose();
  }
}
