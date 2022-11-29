import 'package:casist2/data/data_sources/remote_data_source.dart';
import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/company.dart';
import 'package:casist2/data/storage/secure_storage.dart';
import 'package:casist2/domain/abstraction/conf_repository.dart';
import 'package:casist2/domain/entities/agenda.dart';
import 'package:casist2/domain/entities/company.dart';

class ConfRepositoryImpl extends ConfRepository {

  final RemoteDataSource _remoteDataSource;
  final Storage _storage;

  ConfRepositoryImpl({
    required RemoteDataSource remoteDataSource,
    required Storage storage,
  }): _remoteDataSource = remoteDataSource,
      _storage = storage;

  @override
  Future<List<Company>> searchCompanies(Agenda agenda) async {
    final companies = await _remoteDataSource.searchCompanies(
      agenda: AgendaCasist.fromDomain(agenda)
    );
    return List<Company>.from(companies.map((company) => company.toDomain()));
  }

}