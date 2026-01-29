import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/firebase_constants.dart';

class ConfigService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> loadConfig() async {
    try {
      final doc = await _firestore
          .collection(FirebaseConstants.configCollection)
          .doc('app_config')
          .get();

      if (doc.exists) {
        return doc.data();
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveConfig({
    required double deliveryFee,
    required double minimumOrder,
  }) async {
    await _firestore
        .collection(FirebaseConstants.configCollection)
        .doc('app_config')
        .set({
      'deliveryFee': deliveryFee,
      'minimumOrder': minimumOrder,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
