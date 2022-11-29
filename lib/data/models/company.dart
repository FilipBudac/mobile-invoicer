import 'package:casist2/domain/entities/company.dart';
import 'package:equatable/equatable.dart';

class CompanyCasist extends Equatable {
  final int id;
  final String company;
  final String ico;
  final String dic;
  final String icdph;
  final String street;
  final String streetNumber;
  final String city;
  final String psc;
  final String email;
  final bool voCena;
  String? poznamka;
  int? agendaId;
  String? clientId; // id_number
  String? mobil;

  CompanyCasist({
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
    required this.voCena,
    this.poznamka,
    this.agendaId,
    this.clientId,
    this.mobil,
  });

  factory CompanyCasist.fromDomain(Company company) => CompanyCasist(
    id: company.id,
    company: company.company,
    ico: company.ico,
    dic: company.dic,
    icdph: company.icdph,
    city: company.city,
    street: company.street,
    streetNumber: company.streetNumber,
    psc: company.psc,
    email: company.email,
    voCena: company.voCena,
  );

  factory CompanyCasist.fromJson(Map<String, dynamic> json) => CompanyCasist(
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
  List<Object?> get props => [id, company, ico, dic, icdph, street, streetNumber, psc, email];
}

extension CompanyX on CompanyCasist {
  Company toDomain() {
    return Company(
      id: id,
      company: company,
      ico: ico,
      dic: dic,
      icdph: icdph,
      city: city,
      street: street,
      streetNumber: streetNumber,
      psc: psc,
      email: email,
      voCena: voCena,
    );
  }
}