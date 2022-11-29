import 'package:casist2/domain/entities/agenda.dart';
import 'package:equatable/equatable.dart';

class AgendaCasist extends Equatable {
  final int id;
  final String firma;
  final String ico;
  final String dic;
  final String ulica;
  final String cislo;
  final String mesto;
  final String psc;
  final String email;
  bool? jednoducheUcto;
  bool? active;
  int? client;

  AgendaCasist({
    required this.id,
    required this.firma,
    required this.ico,
    required this.dic,
    required this.ulica,
    required this.cislo,
    required this.mesto,
    required this.psc,
    required this.email,
    this.jednoducheUcto,
    this.active,
    this.client
  });

  factory AgendaCasist.fromDomain(Agenda agenda) => AgendaCasist(
    id: agenda.id,
    firma: agenda.firma,
    ico: agenda.ico,
    dic: agenda.dic,
    ulica: agenda.ulica,
    cislo: agenda.cislo,
    mesto: agenda.mesto,
    psc: agenda.psc,
    email: agenda.email
  );

  factory AgendaCasist.fromJson(Map<String, dynamic> json) => AgendaCasist(
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
  };

  @override
  List<Object?> get props => [id, client, firma, ico, dic, ulica, cislo, mesto, psc, email];
}

extension AgendaX on AgendaCasist {
  Agenda toDomain() {
    return Agenda(
      id: id,
      firma: firma,
      ico: ico,
      dic: dic,
      ulica: ulica,
      cislo: cislo,
      mesto: mesto,
      psc: psc,
      email: email
    );
  }
}