import 'package:casist2/data/data_sources/local_data_source.dart';
import 'package:casist2/data/data_sources/remote_data_source.dart';
import 'package:casist2/data/storage/secure_storage.dart';
import 'package:casist2/data/models/user.dart';
import 'package:casist2/domain/abstraction/auth_repository.dart';
import 'package:casist2/domain/entities/user.dart';

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
    final user = await _remoteDataSource.authenticate(
      username: username,
      password: password
    );
    return user.toDomain();
  }

  @override
  Future<User> getCachedUser() async {
    final user = await _storage.getUser();
    return user.toDomain();
  }

  @override
  Future<void> cacheUser(User user) async {
    _storage.cacheUser(
        UserCasist.fromDomain(user)
    );
  }
}