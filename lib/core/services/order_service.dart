import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constants/firebase_constants.dart';
import '../../../shared/models/order_model.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createOrder(OrderModel order) async {
    final docRef = await _firestore
        .collection(FirebaseConstants.ordersCollection)
        .add(order.toMap());
    
    await docRef.update({'id': docRef.id});
    return docRef.id;
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    await _firestore
        .collection(FirebaseConstants.ordersCollection)
        .doc(orderId)
        .update({
          'status': status,
          'updatedAt': FieldValue.serverTimestamp(),
        });
  }

  Future<void> assignRider(String orderId, String riderId) async {
    await _firestore
        .collection(FirebaseConstants.ordersCollection)
        .doc(orderId)
        .update({
          'riderId': riderId,
          'updatedAt': FieldValue.serverTimestamp(),
        });
  }

  Stream<List<OrderModel>> getCustomerOrders(String customerId) {
    return _firestore
        .collection(FirebaseConstants.ordersCollection)
        .where('customerId', isEqualTo: customerId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrderModel.fromMap(doc.data()))
            .toList());
  }

  Stream<List<OrderModel>> getVendorOrders(String restaurantId) {
    return _firestore
        .collection(FirebaseConstants.ordersCollection)
        .where('restaurantId', isEqualTo: restaurantId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrderModel.fromMap(doc.data()))
            .toList());
  }

  Stream<List<OrderModel>> getRiderOrders(String riderId) {
    return _firestore
        .collection(FirebaseConstants.ordersCollection)
        .where('riderId', isEqualTo: riderId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrderModel.fromMap(doc.data()))
            .toList());
  }

  Stream<OrderModel?> getOrderById(String orderId) {
    return _firestore
        .collection(FirebaseConstants.ordersCollection)
        .doc(orderId)
        .snapshots()
        .map((snapshot) {
          if (snapshot.exists) {
            return OrderModel.fromMap(snapshot.data()!);
          }
          return null;
        });
  }

  Future<void> updateOrder(String orderId, Map<String, dynamic> data) async {
    await _firestore
        .collection(FirebaseConstants.ordersCollection)
        .doc(orderId)
        .update(data);
  }
}
