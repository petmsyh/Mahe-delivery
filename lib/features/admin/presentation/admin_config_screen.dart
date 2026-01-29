import 'package:flutter/material.dart';
import '../../../core/services/config_service.dart';
import '../../../shared/widgets/config_screen_body.dart';

class AdminConfigScreen extends StatefulWidget {
  const AdminConfigScreen({super.key});

  @override
  State<AdminConfigScreen> createState() => _AdminConfigScreenState();
}

class _AdminConfigScreenState extends State<AdminConfigScreen> {
  final _deliveryFeeController = TextEditingController();
  final _minOrderController = TextEditingController();
  final _configService = ConfigService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  Future<void> _loadConfig() async {
    try {
      final data = await _configService.loadConfig();
      if (data != null) {
        _deliveryFeeController.text = (data['deliveryFee'] ?? 0).toString();
        _minOrderController.text = (data['minimumOrder'] ?? 0).toString();
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
    setState(() => _isLoading = true);
    try {
      await _configService.saveConfig(
        deliveryFee: double.parse(_deliveryFeeController.text),
        minimumOrder: double.parse(_minOrderController.text),
      );
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
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuration')),
      body: ConfigScreenBody(
        deliveryFeeController: _deliveryFeeController,
        minOrderController: _minOrderController,
        isLoading: _isLoading,
        onSave: _saveConfig,
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
