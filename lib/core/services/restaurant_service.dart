import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constants/firebase_constants.dart';
import '../../../shared/models/restaurant_model.dart';
import '../../../shared/models/menu_item_model.dart';

class RestaurantService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<RestaurantModel>> getRestaurants() {
    return _firestore
        .collection(FirebaseConstants.restaurantsCollection)
        .where('isActive', isEqualTo: true)
        .where('isApproved', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => RestaurantModel.fromMap(doc.data()))
            .toList());
  }

  Future<RestaurantModel?> getRestaurantById(String id) async {
    final doc = await _firestore
        .collection(FirebaseConstants.restaurantsCollection)
        .doc(id)
        .get();
    
    if (doc.exists) {
      return RestaurantModel.fromMap(doc.data()!);
    }
    return null;
  }

  Stream<List<MenuItemModel>> getMenuItems(String restaurantId) {
    return _firestore
        .collection(FirebaseConstants.menuItemsCollection)
        .where('restaurantId', isEqualTo: restaurantId)
        .where('isAvailable', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MenuItemModel.fromMap(doc.data()))
            .toList());
  }

  Future<void> createRestaurant(RestaurantModel restaurant) async {
    await _firestore
        .collection(FirebaseConstants.restaurantsCollection)
        .doc(restaurant.id)
        .set(restaurant.toMap());
  }

  Future<void> updateRestaurant(RestaurantModel restaurant) async {
    await _firestore
        .collection(FirebaseConstants.restaurantsCollection)
        .doc(restaurant.id)
        .update(restaurant.toMap());
  }

  Future<void> createMenuItem(MenuItemModel menuItem) async {
    await _firestore
        .collection(FirebaseConstants.menuItemsCollection)
        .doc(menuItem.id)
        .set(menuItem.toMap());
  }

  Future<void> updateMenuItem(MenuItemModel menuItem) async {
    await _firestore
        .collection(FirebaseConstants.menuItemsCollection)
        .doc(menuItem.id)
        .update(menuItem.toMap());
  }

  Future<void> deleteMenuItem(String id) async {
    await _firestore
        .collection(FirebaseConstants.menuItemsCollection)
        .doc(id)
        .delete();
  }
}
