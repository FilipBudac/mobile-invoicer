import 'package:casist2/domain/entities/user_settings.dart';
import 'package:equatable/equatable.dart';
import 'agenda.dart';
import 'auth.dart';
import 'company.dart';
import 'store.dart';

class User extends Equatable {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  UserSettings settings;
  Agenda? currentAgenda;
  List<Agenda> agendas;
  List<Map<String, dynamic>> agendasReference;
  Company? company;
  Store? store;
  Auth auth;


  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.settings,
    required this.store,
    required this.currentAgenda,
    required this.agendas,
    required this.agendasReference,
    required this.auth,
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
        settings: UserSettings.fromJson(json["settings"]),
        currentAgenda: Agenda.fromJson(json["currentAgenda"]),
        store: Store.fromJson(json["prevadzka"]),
        agendas: List<Agenda>.from(json["agendy"].map((agenda) => Agenda.fromJson(agenda))),
        agendasReference: List<Map<String, dynamic>>.from(userData["agenda"]),
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
        "agenda": agendasReference
      },
      "prevadzka": store?.toJson(),
      "settings": settings.toJson(),
      "store": store?.toJson(),
      "company": company?.toJson(),
      "agenda": currentAgenda?.toJson(),
      "agendy": List<Map<String, dynamic>>.from(agendas.map((agenda) => agenda.toJson())),
    };
  }

  @override
  List<Object?> get props => [id, username, firstName, lastName];
}