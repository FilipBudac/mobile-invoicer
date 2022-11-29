import 'dart:convert';
import 'package:casist2/core/error/exceptions.dart';
import 'package:casist2/data/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class Storage {

  Future<UserCasist> getUser();
  Future<void> cacheUser(UserCasist user);

}

class SecureStorage extends Storage {
  final FlutterSecureStorage _storage;

  SecureStorage({
    required FlutterSecureStorage storage
  }) : _storage = storage;

  @override
  Future<UserCasist> getUser() async {
    String? cachedUser = await _storage.read(key: "user");
    if (cachedUser == null) {
      throw CacheFailed();
    }
    final user = UserCasist.fromJson(
      jsonDecode(cachedUser)
    );
    return user;
  }

  @override
  Future<void> cacheUser(UserCasist user) async {
    await _storage.write(key: "user", value: jsonEncode(user.toJson()));
  }
}