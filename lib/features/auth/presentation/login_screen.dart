import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/constants/user_role.dart';
import '../../../core/utils/validators.dart';
import '../../../shared/providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  UserRole _selectedRole = UserRole.customer;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _sendOTP() {
    if (_formKey.currentState!.validate()) {
      final authProvider = context.read<AuthProvider>();
      authProvider.sendOTP(_phoneController.text);
      
      Navigator.pushNamed(
        context,
        RouteConstants.otpVerification,
        arguments: {
          'phoneNumber': _phoneController.text,
          'role': _selectedRole,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.delivery_dining, size: 80, color: Colors.orange),
                const SizedBox(height: 20),
                const Text('Welcome', textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                    hintText: '+251912345678',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: Validators.validatePhone,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<UserRole>(
                  value: _selectedRole,
                  decoration: const InputDecoration(
                    labelText: 'I am a',
                    prefixIcon: Icon(Icons.person),
                  ),
                  items: [
                    UserRole.customer,
                    UserRole.vendor,
                    UserRole.rider,
                  ].map((role) => DropdownMenuItem(
                    value: role,
                    child: Text(role.displayName),
                  )).toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => _selectedRole = value);
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(onPressed: _sendOTP, child: const Text('Send OTP')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
