import 'package:casist2/data/data_sources/local_data_source.dart';
import 'package:casist2/data/data_sources/remote_data_source.dart';
import 'package:casist2/data/storage/secure_storage.dart';
import 'package:casist2/data/models/user.dart';
import 'package:casist2/domain/abstraction/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {

  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final Storage _storage;

  AuthRepositoryImpl({
    required RemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
    required Storage storage,
  }): _remoteDataSource = remoteDataSource,
      _localDataSource = localDataSource,
      _storage = storage;

  @override
  Future<User> authenticate(
    String username,
    String password
  ) async {
    return _remoteDataSource.authenticate(
      username: username,
      password: password
    );
  }

  @override
  Future<User> getCachedUser() async {
    return _storage.getUser();
  }

  @override
  Future<void> cacheUser(User user) async {
    _storage.cacheUser(user);
  }
}