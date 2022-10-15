import 'package:casist2/core/error/exceptions.dart';
import 'package:casist2/core/error/failures.dart';
import 'package:casist2/core/use_cases/use_case.dart';
import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/company.dart';
import 'package:casist2/domain/abstraction/conf_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchCompaniesUseCase implements UseCase<List<Company>, SearchCompaniesParams> {
  final ConfRepository _repository;

  SearchCompaniesUseCase({
    required ConfRepository repository
  }): _repository = repository;

  @override
  Future<Either<Failure, List<Company>>> call(SearchCompaniesParams params) async {
    try {
      List<Company> companies = await _repository.searchCompanies(params.agenda);
      return Right(companies);
    } on RequestUnauthorized {
      // TODO: test
      return Left(AuthorizationFailure());
    } on RequestFailed {
      return Left(ServerFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}

class SearchCompaniesParams extends Equatable {
  final Agenda agenda;

  const SearchCompaniesParams({
    required this.agenda
  });

  @override
  List<Object> get props => [agenda];
}