import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/company.dart';
import 'package:casist2/data/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ConfState extends Equatable {
  const ConfState();

  @override
  List<Object?> get props => [];
}

class ConfInitialState extends ConfState {}

class ConfProcessingState extends ConfState {}

class ConfUnauthorizedState extends ConfState {}

class ConfScannedState extends ConfState {
  final String idNumber;

  const ConfScannedState({
    required this.idNumber
  });

  @override
  List<Object> get props => [idNumber];
}

class ConfErrorState extends ConfState {
  final String error;

  const ConfErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class ConfAgendaSelectedState extends ConfState {
  final List<Company> companies;
  final Agenda agenda;
  final String message;

  const ConfAgendaSelectedState({
    required this.companies,
    required this.agenda,
    required this.message
  });

  @override
  List<Object> get props => [companies, agenda, message];
}

class ConfFinishedState extends ConfState {
  final User user;

  const ConfFinishedState({
    required this.user
  });

  @override
  List<Object> get props => [user];
}

