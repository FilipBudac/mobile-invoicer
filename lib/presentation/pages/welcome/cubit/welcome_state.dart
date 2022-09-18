import 'package:casist2/data/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object?> get props => [];
}

class WelcomeInitialState extends WelcomeState {
  final bool inProgress;
  const WelcomeInitialState({required this.inProgress});

  @override
  List<Object> get props => [inProgress];
}

class WelcomeFinishedState extends WelcomeState {
  final User? user;
  const WelcomeFinishedState({this.user});
}

class WelcomeUnfinishedState extends WelcomeState {}

class WelcomeErrorState extends WelcomeState {
  final String error;
  const WelcomeErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
