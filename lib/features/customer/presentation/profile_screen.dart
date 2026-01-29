import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/providers/auth_provider.dart';
import '../../../core/constants/route_constants.dart';
import '../../../shared/widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          final user = authProvider.currentUser;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ProfileHeader(user: user),
              const SizedBox(height: 32),
              Card(child: ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Edit Profile'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {})),
              Card(child: ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: const Text('Delivery Addresses'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {})),
              Card(child: ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Payment Methods'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {})),
              Card(child: ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: const Text('Notifications'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {})),
              Card(child: ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text('Help & Support'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {})),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await authProvider.signOut();
                  if (context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context, RouteConstants.login, (route) => false);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Sign Out'),
              ),
            ],
          );
        },
      ),
    );
  }
}
