import 'package:casist2/core/error/exceptions.dart';
import 'package:casist2/core/error/failures.dart';
import 'package:casist2/core/use_case.dart';
import 'package:casist2/data/models/user.dart';
import 'package:casist2/domain/abstraction/auth_repository.dart';
import 'package:casist2/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignInUserUseCase implements UseCase<User, SignInParams> {
  final AuthRepository _repository;

  SignInUserUseCase({
    required AuthRepository repository
  }): _repository = repository;

  @override
  Future<Either<Failure, User>> call(SignInParams params) async {
    try {
      // TODO: use named params for constructor?
      final user = await _repository.authenticate(params.username, params.password);
      return Right(user);
    } on RequestFailed {
      return Left(ServerFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}

class SignInParams extends Equatable {
  final String username;
  final String password;

  const SignInParams({
    required this.username,
    required this.password
  });

  @override
  List<Object> get props => [username, password];
}