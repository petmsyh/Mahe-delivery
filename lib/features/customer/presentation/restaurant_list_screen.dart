import 'package:flutter/material.dart';
import '../../../shared/models/restaurant_model.dart';
import '../../../core/services/restaurant_service.dart';
import '../../../shared/widgets/restaurant_card.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantService = RestaurantService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search restaurants...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<RestaurantModel>>(
              stream: restaurantService.getRestaurants(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final restaurants = snapshot.data ?? [];

                if (restaurants.isEmpty) {
                  return const Center(
                    child: Text('No restaurants available'),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return RestaurantCard(restaurant: restaurants[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
