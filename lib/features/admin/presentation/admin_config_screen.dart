import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/constants/firebase_constants.dart';

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
          Card(
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
                    controller: _deliveryFeeController,
                    decoration: const InputDecoration(
                      labelText: 'Default Delivery Fee (\$)',
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _minOrderController,
                    decoration: const InputDecoration(
                      labelText: 'Minimum Order Amount (\$)',
                      prefixIcon: Icon(Icons.shopping_bag),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Service Areas'),
              subtitle: const Text('Manage delivery service areas'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to service areas
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Operating Hours'),
              subtitle: const Text('Set restaurant operating hours'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to operating hours
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              subtitle: const Text('Manage food categories'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to categories
              },
            ),
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
