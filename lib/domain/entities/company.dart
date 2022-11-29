import 'package:equatable/equatable.dart';

class Company extends Equatable {
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
    required this.voCena,
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
    voCena: json["vo_cena"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firma": company,
    "ico": ico,
    "dic": dic,
    "icdph": icdph,
    "city": city,
    "ulica": street,
    "cislo": streetNumber,
    "psc": psc,
    "email": email,
    "vo_cena": voCena,
  };

  @override
  List<Object?> get props => [id, company, ico, dic, icdph, street, streetNumber, psc, email];
}
