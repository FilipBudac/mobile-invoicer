import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final int id;
  final String company; // firma
  final String ico;
  final String dic;
  final String icdph;
  final String street; // ulica
  final String streetNumber; // cislo
  final String city; // mesto
  final String psc;
  final String email;
  final String poznamka;
  final int agendaId; // agenda_id
  final bool voCena; // vo_cena
  final String clientId; // id_number
  final String mobil;

  const Company({
    required this.id,
    required this.company,
    required this.ico,
    required this.dic,
    required this.icdph,
    required this.street,
    required this.streetNumber,
    required this.city,
    required this.psc,
    required this.email,
    required this.poznamka,
    required this.agendaId,
    required this.voCena,
    required this.clientId,
    required this.mobil,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    company: json["firma"],
    ico: json["ico"],
    dic: json["dic"],
    icdph: json["icdph"],
    street: json["ulica"],
    city: json["mesto"],
    streetNumber: json["cislo"],
    psc: json["psc"],
    email: json["email"],
    poznamka: json["poznamka"],
    voCena: json["vo_cena"],
    clientId: json["id_klient"],
    mobil: json["mobil"],
    agendaId: json["agenda_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firma": company,
    "ico": ico,
    "dic": dic,
    "icdph": icdph,
    "ulica": street,
    "cislo": streetNumber,
    "psc": psc,
    "email": email,
    "poznamka": poznamka,
    "vo_cena": voCena,
    "id_klient": clientId,
    "mobil": mobil
  };

  @override
  String toString() {
    return 'Company{id: $id, company: $company, ico: $ico, dic: $dic, icdph: $icdph, street: $street, streetNumber: $streetNumber, city: $city, psc: $psc, email: $email, poznamka: $poznamka, agendaId: $agendaId, voCena: $voCena, clientId: $clientId, mobil: $mobil}';
  }

  @override
  List<Object?> get props => [id, company, ico, dic, icdph, street, streetNumber, psc, email];
}
