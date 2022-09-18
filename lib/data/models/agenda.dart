import 'package:equatable/equatable.dart';

class Agenda extends Equatable {
  final int id;
  final String firma;
  final String ico;
  final String dic;
  final String ulica;
  final String cislo;
  final String mesto;
  final String psc;
  final String email;
  final bool jednoducheUcto;
  final bool svb;
  final bool active;
  final int client;

  const Agenda({
    required this.id,
    required this.firma,
    required this.ico,
    required this.dic,
    required this.ulica,
    required this.cislo,
    required this.mesto,
    required this.psc,
    required this.email,
    required this.jednoducheUcto,
    required this.svb,
    required this.active,
    required this.client
  });

  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
    id: json["id"],
    client: json['client'],
    firma: json["firma"],
    ico: json["ico"],
    dic: json["dic"],
    ulica: json["ulica"],
    cislo: json["cislo"],
    mesto: json["mesto"],
    psc: json["psc"],
    email: json["email"],
    jednoducheUcto: json["jednoduche_ucto"],
    active: json["active"],
    svb: json["svb"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "client": client,
    "firma": firma,
    "ico": ico,
    "dic": dic,
    "ulica": ulica,
    "cislo": cislo,
    "mesto": mesto,
    "psc": psc,
    "email": email,
    "jednoduche_ucto": jednoducheUcto,
    "active": active,
    "svb": svb,
  };

  @override
  String toString() {
    return 'Agenda{id: $id, firma: $firma, ico: $ico, dic: $dic, ulica: $ulica, cislo: $cislo, mesto: $mesto, psc: $psc, email: $email, jednoducheUcto: $jednoducheUcto, svb: $svb, active: $active, client: $client}';
  }

  @override
  List<Object?> get props => [id, client, firma, ico, dic, ulica, cislo, mesto, psc, email];
}