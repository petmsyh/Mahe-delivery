import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../shared/models/restaurant_model.dart';
import '../../../core/constants/firebase_constants.dart';

class AdminVendorsScreen extends StatelessWidget {
  const AdminVendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Management'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(FirebaseConstants.restaurantsCollection)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final restaurants = snapshot.data?.docs ?? [];

          if (restaurants.isEmpty) {
            return const Center(child: Text('No vendors found'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurantData = 
                  restaurants[index].data() as Map<String, dynamic>;
              final restaurant = RestaurantModel.fromMap(restaurantData);
              return VendorCard(restaurant: restaurant);
            },
          );
        },
      ),
    );
  }
}

class VendorCard extends StatelessWidget {
  final RestaurantModel restaurant;

  const VendorCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                restaurant.imageUrl,
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
            title: Text(restaurant.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(restaurant.address),
                Row(
                  children: [
                    Icon(
                      restaurant.isApproved 
                          ? Icons.check_circle 
                          : Icons.pending,
                      size: 16,
                      color: restaurant.isApproved 
                          ? Colors.green 
                          : Colors.orange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      restaurant.isApproved ? 'Approved' : 'Pending',
                      style: TextStyle(
                        color: restaurant.isApproved 
                            ? Colors.green 
                            : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'approve') {
                  _toggleApproval(context);
                } else if (value == 'suspend') {
                  _toggleActive(context);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'approve',
                  child: Text(
                    restaurant.isApproved ? 'Unapprove' : 'Approve',
                  ),
                ),
                PopupMenuItem(
                  value: 'suspend',
                  child: Text(
                    restaurant.isActive ? 'Suspend' : 'Activate',
                  ),
                ),
              ],
            ),
          ),
          if (!restaurant.isApproved)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _rejectVendor(context),
                    child: const Text('Reject'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _approveVendor(context),
                    child: const Text('Approve'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _toggleApproval(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.restaurantsCollection)
          .doc(restaurant.id)
          .update({'isApproved': !restaurant.isApproved});
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              restaurant.isApproved 
                  ? 'Vendor unapproved' 
                  : 'Vendor approved',
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  void _toggleActive(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.restaurantsCollection)
          .doc(restaurant.id)
          .update({'isActive': !restaurant.isActive});
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              restaurant.isActive ? 'Vendor suspended' : 'Vendor activated',
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  void _approveVendor(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.restaurantsCollection)
          .doc(restaurant.id)
          .update({'isApproved': true});
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vendor approved')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  void _rejectVendor(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reject Vendor'),
        content: const Text('Are you sure you want to reject this vendor?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await FirebaseFirestore.instance
                    .collection(FirebaseConstants.restaurantsCollection)
                    .doc(restaurant.id)
                    .delete();
                
                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vendor rejected')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Reject'),
          ),
        ],
      ),
    );
  }
}
