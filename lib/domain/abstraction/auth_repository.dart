import 'package:casist2/domain/entities/user.dart';

abstract class AuthRepository {

  Future<User> authenticate(String username, String password);
  Future<User> getCachedUser();
  Future<void> cacheUser(User user);

}