import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../shared/models/restaurant_model.dart';
import '../../../core/constants/firebase_constants.dart';
import '../../../shared/widgets/vendor_card.dart';

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
