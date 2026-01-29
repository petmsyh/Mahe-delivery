import 'package:firebase_database/firebase_database.dart';
import '../../constants/firebase_constants.dart';

class LocationService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  Future<void> updateRiderLocation({
    required String riderId,
    required double latitude,
    required double longitude,
  }) async {
    await _database
        .ref(FirebaseConstants.riderLocationsPath)
        .child(riderId)
        .set({
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': ServerValue.timestamp,
    });
  }

  Stream<Map<String, dynamic>?> getRiderLocation(String riderId) {
    return _database
        .ref(FirebaseConstants.riderLocationsPath)
        .child(riderId)
        .onValue
        .map((event) {
      if (event.snapshot.value != null) {
        return Map<String, dynamic>.from(
          event.snapshot.value as Map,
        );
      }
      return null;
    });
  }

  Future<void> removeRiderLocation(String riderId) async {
    await _database
        .ref(FirebaseConstants.riderLocationsPath)
        .child(riderId)
        .remove();
  }

  Future<void> updateOrderTracking({
    required String orderId,
    required Map<String, dynamic> trackingData,
  }) async {
    await _database
        .ref(FirebaseConstants.orderTrackingPath)
        .child(orderId)
        .update(trackingData);
  }

  Stream<Map<String, dynamic>?> getOrderTracking(String orderId) {
    return _database
        .ref(FirebaseConstants.orderTrackingPath)
        .child(orderId)
        .onValue
        .map((event) {
      if (event.snapshot.value != null) {
        return Map<String, dynamic>.from(
          event.snapshot.value as Map,
        );
      }
      return null;
    });
  }
}
