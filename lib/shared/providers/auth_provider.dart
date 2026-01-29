import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/services/auth_service.dart';
import '../../shared/models/user_model.dart';
import '../../core/constants/user_role.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  
  UserModel? _currentUser;
  bool _isLoading = false;
  String? _error;
  String? _verificationId;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _currentUser != null;
  UserRole? get userRole => _currentUser?.role;

  Future<void> initialize() async {
    _setLoadingState(true);
    final user = _authService.currentUser;
    if (user != null) _currentUser = await _authService.getUserData(user.uid);
    _setLoadingState(false);
  }

  Future<void> sendOTP(String phoneNumber) async {
    _setLoadingState(true);
    try {
      await _authService.verifyPhoneNumber(phoneNumber: phoneNumber,
        codeSent: _onCodeSent, verificationFailed: _onVerificationFailed);
    } catch (e) {
      _error = e.toString();
      _setLoadingState(false);
    }
  }

  void _setLoadingState(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _onCodeSent(String verificationId) {
    _verificationId = verificationId;
    _setLoadingState(false);
  }

  void _onVerificationFailed(String error) {
    _error = error;
    _setLoadingState(false);
  }

  Future<bool> verifyOTP(String otp, UserRole role) async {
    if (_verificationId == null) {
      _error = 'Verification ID not found';
      notifyListeners();
      return false;
    }
    _setLoadingState(true);
    try {
      final credential = await _authService.verifyOTP(
        verificationId: _verificationId!, smsCode: otp);
      return await _handleCredential(credential, role);
    } catch (e) {
      _error = e.toString();
      _setLoadingState(false);
      return false;
    }
  }

  Future<bool> _handleCredential(dynamic credential, UserRole role) async {
    final user = credential.user;
    if (user == null) return false;
    _currentUser = await _authService.getUserData(user.uid);
    if (_currentUser == null) {
      _currentUser = UserModel(
        id: user.uid,
        phoneNumber: user.phoneNumber ?? '',
        role: role,
        createdAt: DateTime.now());
      await _authService.createUser(_currentUser!);
    }
    _setLoadingState(false);
    return true;
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _currentUser = null;
    _verificationId = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
