import 'package:casist2/core/error/failures.dart';
import 'package:casist2/core/use_cases/use_case.dart';
import 'package:casist2/data/models/user.dart';
import 'package:casist2/domain/abstraction/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CacheUserUseCase implements UseCase<User, CacheUserParams> {
  final AuthRepository _repository;

  CacheUserUseCase({
    required AuthRepository repository
  }): _repository = repository;

  @override
  Future<Either<Failure, User>> call(CacheUserParams params) async {
    try {
      await _repository.cacheUser(params.user);
      return Right(params.user);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}

class CacheUserParams extends Equatable {
  final User user;

  const CacheUserParams({
    required this.user
  });

  @override
  List<Object> get props => [user];
}