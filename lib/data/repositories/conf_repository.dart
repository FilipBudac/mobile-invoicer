import 'package:casist2/data/data_sources/remote_data_source.dart';
import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/company.dart';
import 'package:casist2/data/storage/secure_storage.dart';
import 'package:casist2/domain/abstraction/conf_repository.dart';

class ConfRepositoryImpl extends ConfRepository {

  final RemoteDataSource _remoteDataSource;
  final Storage _storage;

  ConfRepositoryImpl({
    required RemoteDataSource remoteDataSource,
    required Storage storage,
  }): _remoteDataSource = remoteDataSource,
      _storage = storage;

  @override
  Future<List<Company>> searchCompanies(Agenda agenda) {
    return _remoteDataSource.searchCompanies(agenda: agenda);
  }

}