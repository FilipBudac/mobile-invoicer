import 'package:casist2/data/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInInitialState extends SignInState {}

class SignInProcessingState extends SignInState {}

class SignInFinishedState extends SignInState {
  final User user;

  const SignInFinishedState({
    required this.user
  });

  @override
  List<Object> get props => [user];
}

class SignInErrorState extends SignInState {
  final String error;

  const SignInErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class SignInUserCachedState extends SignInState {
  final User user;

  const SignInUserCachedState({
    required this.user
  });

  @override
  List<Object> get props => [user];
}
