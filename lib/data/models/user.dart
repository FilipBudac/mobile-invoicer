import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/auth.dart';
import 'package:casist2/data/models/company.dart';
import 'package:casist2/data/models/store.dart';
import 'package:equatable/equatable.dart';

import 'user_settings.dart';

class User extends Equatable {
  final int id;
  final bool isSuperuser;
  final String username;
  final String firstName;
  final String lastName;
  final bool isActive;
  final int lastObdobie;
  final bool activated;
  final int lastAgendaId;
  UserSettings settings;
  List<Agenda> agendas;
  Agenda? currentAgenda;
  Company? company;
  Store? store;
  Auth auth;

  User({
    required this.id,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    required this.lastObdobie,
    required this.activated,
    required this.lastAgendaId,
    required this.settings,
    required this.store,
    required this.agendas,
    required this.auth,
    this.currentAgenda,
    this.company
  });

  String get accessToken => auth.accessToken;
  String get refreshToken => auth.refreshToken;

  factory User.fromJson(Map<String, dynamic> json) {
    final userData = json["user_data"];
    final authData = {
      "access_token": json["access_token"],
      "refresh_token": json["refresh_token"],
      "scope": json["scope"],
    };

    return User(
        id: userData["id"],
        username: userData["username"],
        firstName: userData["first_name"],
        lastName: userData["last_name"],
        isSuperuser: userData["is_superuser"],
        isActive: userData["is_active"],
        activated: userData["activated"],
        lastAgendaId: userData["lastAgenda"],
        lastObdobie: userData["lastObdobie"],
        settings: UserSettings.fromJson(json["settings"]),
        store: Store.fromJson(json["prevadzka"]),
        agendas: List<Agenda>.from(json["agendy"].map((agenda) => Agenda.fromJson(agenda))),
        currentAgenda: json["currentAgenda"] != null ? Agenda.fromJson(json["currentAgenda"]) : null,
        company: json["company"] != null ? Company.fromJson(json["company"]) : null,
        auth: Auth.fromJson(authData)
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "access_token": auth.accessToken,
      "refresh_token": auth.refreshToken,
      "scope": auth.scope,
      "user_data": {
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "is_superuser": isSuperuser,
        "is_active": isActive,
        "activated": activated,
        "lastAgenda": lastAgendaId,
        "lastObdobie": lastObdobie,
      },
      "prevadzka": store?.toJson(),
      "settings": settings.toJson(),
      "store": store?.toJson(),
      "currentAgenda": currentAgenda?.toJson(),
      "company": company?.toJson(),
      "agendy": List<Map<String, dynamic>>.from(agendas.map((agenda) => agenda.toJson())),
    };
  }

  @override
  String toString() {
    return 'User{id: $id, isSuperuser: $isSuperuser, username: $username, firstName: $firstName, lastName: $lastName, isActive: $isActive, lastObdobie: $lastObdobie, activated: $activated, lastAgendaId: $lastAgendaId, userSettings: $settings, agendas: $agendas}';
  }

  @override
  List<Object?> get props => [id, username, firstName, lastName, isSuperuser, isActive, activated, lastAgendaId, lastObdobie];
}