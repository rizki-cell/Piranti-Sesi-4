import 'dart:convert';
import 'package:flutter_application_1/core/hive_storage.dart';
import 'package:flutter_application_1/model/photo.dart';

const authKey = 'authBox';

class AuthRepository {
  Future<User?> save(User user) async {
    try {
      await HiveStorage.instance.box.put(authKey, jsonEncode(user.toJson()));
      return await getUser();
    } catch (_) {
      return null;
    }
  }

  Future<User?> getUser() async {
    try {
      final jsonString = await HiveStorage.instance.box.get(authKey);
      if (jsonString == null) return null;
      return User.fromJson(jsonDecode(jsonString));
    } catch (_) {
      return null;
    }
  }

  Future<User?> delete() async {
    try {
      await HiveStorage.instance.box.delete(authKey);
      return null; // Tidak perlu memanggil `getUser()` karena data sudah dihapus
    } catch (_) {
      return null;
    }
  }
}
