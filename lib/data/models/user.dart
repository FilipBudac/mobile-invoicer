import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/auth.dart';
import 'package:casist2/data/models/company.dart';
import 'package:casist2/data/models/store.dart';
import 'package:casist2/domain/entities/agenda.dart';
import 'package:casist2/domain/entities/user.dart';
import 'package:equatable/equatable.dart';
import 'user_settings.dart';

class UserCasist extends Equatable {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  bool? isSuperuser;
  bool? isActive;
  int? lastObdobie;
  bool? activated;
  int? lastAgendaId;
  UserSettingsCasist settings;
  List<AgendaCasist> agendas;
  List<Map<String, dynamic>> agendasReference;
  AgendaCasist? currentAgenda;
  CompanyCasist? company;
  StoreCasist? store;
  AuthCasist auth;

  UserCasist({
    required this.id,
    this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.agendasReference,
    required this.settings,
    required this.store,
    required this.agendas,
    required this.auth,
    this.isActive,
    this.lastObdobie,
    this.activated,
    this.lastAgendaId,
    this.currentAgenda,
    this.company
  });

  String get accessToken => auth.accessToken;
  String get refreshToken => auth.refreshToken;

  factory UserCasist.fromDomain(User user) {
    return UserCasist(
      id: user.id,
      username: user.username,
      firstName: user.firstName,
      lastName: user.lastName,
      agendasReference: user.agendasReference,
      auth: AuthCasist.fromDomain(user.auth),
      currentAgenda: user.currentAgenda != null ? AgendaCasist.fromDomain(user.currentAgenda!): null,
      store: StoreCasist.fromDomain(user.store!),
      settings: UserSettingsCasist.fromDomain(user.settings),
      company: user.company != null ? CompanyCasist.fromDomain(user.company!) : null,
      agendas: List<AgendaCasist>.from(user.agendas.map((agenda) => AgendaCasist.fromDomain(agenda))),
    );
  }

  factory UserCasist.fromJson(Map<String, dynamic> json) {
    final userData = json["user_data"];
    final authData = {
      "access_token": json["access_token"],
      "refresh_token": json["refresh_token"],
      "scope": json["scope"],
    };
    return UserCasist(
        id: userData["id"],
        username: userData["username"],
        firstName: userData["first_name"],
        lastName: userData["last_name"],
        isSuperuser: userData["is_superuser"],
        isActive: userData["is_active"],
        activated: userData["activated"],
        lastAgendaId: userData["lastAgenda"],
        lastObdobie: userData["lastObdobie"],
        settings: UserSettingsCasist.fromJson(json["settings"]),
        store: StoreCasist.fromJson(json["prevadzka"]),
        agendas: List<AgendaCasist>.from(json["agendy"].map((agenda) => AgendaCasist.fromJson(agenda))),
        agendasReference: List<Map<String, dynamic>>.from(userData["agenda"]),
        currentAgenda: json["currentAgenda"] != null ? AgendaCasist.fromJson(json["currentAgenda"]) : null,
        company: json["company"] != null ? CompanyCasist.fromJson(json["company"]) : null,
        auth: AuthCasist.fromJson(authData)
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
        "agenda": agendasReference
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
  List<Object?> get props => [id, username, firstName, lastName, isSuperuser, isActive, activated, lastAgendaId, lastObdobie];
}

extension UserX on UserCasist {
  User toDomain() {
    return User(
      id: id,
      auth: auth.toDomain(),
      username: username,
      firstName: firstName,
      lastName: lastName,
      agendasReference: agendasReference,
      currentAgenda: currentAgenda?.toDomain(),
      store: store?.toDomain(),
      settings: settings.toDomain(),
      company: company?.toDomain(),
      agendas: List<Agenda>.from(agendas.map((agenda) => agenda.toDomain())),
    );
  }
  String get fullName {
    return firstName + lastName;
  }
}