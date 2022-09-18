import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class ConfEvent extends Equatable {
  const ConfEvent();

  @override
  List<Object> get props => [];
}

class ConfScanEvent extends ConfEvent {}

class ConfSearchCompaniesEvent extends ConfEvent {
  final Agenda agenda;

  const ConfSearchCompaniesEvent({
    required this.agenda
  });

  @override
  List<Object> get props => [agenda];
}

class ConfSaveEvent extends ConfEvent {
  final User user;

  const ConfSaveEvent({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}
