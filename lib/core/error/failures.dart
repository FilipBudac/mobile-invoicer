import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}
class CacheFailure extends Failure {}
class UserFailure extends Failure {}
class ScanFailure extends Failure {}
class AuthorizationFailure extends Failure {}
