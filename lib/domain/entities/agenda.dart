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
  });

  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
      id: json["id"],
      firma: json["firma"],
      ico: json["ico"],
      dic: json["dic"],
      ulica: json["ulica"],
      cislo: json["cislo"],
      mesto: json["mesto"],
      psc: json["psc"],
      email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firma": firma,
    "ico": ico,
    "dic": dic,
    "ulica": ulica,
    "cislo": cislo,
    "mesto": mesto,
    "psc": psc,
    "email": email,
  };

  @override
  List<Object?> get props => [id, firma, ico, dic, ulica, cislo, mesto, psc, email];
}