import 'package:casist2/data/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInPressedEvent extends SignInEvent {
  final String username;
  final String password;

  const SignInPressedEvent({
    required this.username,
    required this.password
  });

  @override
  List<Object> get props => [username, password];
}

class SignInCacheUserEvent extends SignInEvent {
  final User user;

  const SignInCacheUserEvent({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}


