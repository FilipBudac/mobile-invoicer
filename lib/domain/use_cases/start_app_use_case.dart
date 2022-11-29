import 'package:casist2/core/error/exceptions.dart';
import 'package:casist2/core/error/failures.dart';
import 'package:casist2/core/use_case.dart';
import 'package:casist2/domain/abstraction/auth_repository.dart';
import 'package:casist2/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

class StartAppUseCase implements UseCase<User, NoParams> {
  final AuthRepository _repository;

  StartAppUseCase({
    required AuthRepository repository
  }): _repository = repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    try {
      final cachedUser = await _repository.getCachedUser();
      return Right(cachedUser);
    } on CacheFailed {
      return Left(UserFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
