import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import '../../constants/firebase_constants.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadMenuImage({
    required File file,
    required String restaurantId,
    required String menuItemId,
  }) async {
    final ref = _storage.ref().child(
      '${FirebaseConstants.menuImagesPath}/$restaurantId/$menuItemId.jpg',
    );

    final uploadTask = await ref.putFile(file);
    return await uploadTask.ref.getDownloadURL();
  }

  Future<String> uploadRestaurantImage({
    required File file,
    required String restaurantId,
  }) async {
    final ref = _storage.ref().child(
      '${FirebaseConstants.restaurantImagesPath}/$restaurantId.jpg',
    );

    final uploadTask = await ref.putFile(file);
    return await uploadTask.ref.getDownloadURL();
  }

  Future<String> uploadProfileImage({
    required File file,
    required String userId,
  }) async {
    final ref = _storage.ref().child(
      '${FirebaseConstants.userProfileImagesPath}/$userId.jpg',
    );

    final uploadTask = await ref.putFile(file);
    return await uploadTask.ref.getDownloadURL();
  }

  Future<void> deleteFile(String fileUrl) async {
    try {
      final ref = _storage.refFromURL(fileUrl);
      await ref.delete();
    } catch (e) {
      print('Error deleting file: $e');
    }
  }

  Future<List<String>> uploadMultipleImages({
    required List<File> files,
    required String path,
  }) async {
    final List<String> urls = [];
    
    for (int i = 0; i < files.length; i++) {
      final ref = _storage.ref().child('$path/image_$i.jpg');
      final uploadTask = await ref.putFile(files[i]);
      final url = await uploadTask.ref.getDownloadURL();
      urls.add(url);
    }
    
    return urls;
  }
}
