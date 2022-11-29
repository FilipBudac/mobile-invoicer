import 'package:casist2/domain/entities/agenda.dart';
import 'package:casist2/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class ConfEvent extends Equatable {
  const ConfEvent();

  @override
  List<Object> get props => [];
}

class ConfScanEvent extends ConfEvent {}

class ConfAgendaSelectedEvent extends ConfEvent {
  final Agenda agenda;

  const ConfAgendaSelectedEvent({
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
