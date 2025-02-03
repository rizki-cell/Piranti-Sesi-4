import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/photo.dart';
import 'package:flutter_application_1/model/repository/auth_repository.dart';

class AuthController extends ChangeNotifier {
  User? _user;
  final AuthRepository _authRepository = AuthRepository(); // ✅ Buat Instance

  User? get user => _user;

  Future<void> fetch() async {
    _user = await _authRepository.getUser();
    notifyListeners();
  }

  Future<void> login(User user) async {
    _user = await _authRepository.save(user);
    notifyListeners();
  }

  Future<void> logout() async {
    await _authRepository.delete();
    _user = null; // ✅ Pastikan user dihapus setelah logout
    notifyListeners();
  }
}
