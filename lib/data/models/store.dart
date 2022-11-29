
import 'package:casist2/domain/entities/store.dart';

class StoreCasist {
  final int id;
  final String prevadzka;
  final String ulica;
  final String cislo;
  final String mesto;
  final String psc;
  final String kod;
  String? tel;
  String? email;
  String? web;

  StoreCasist({
    required this.id,
    required this.prevadzka,
    required this.ulica,
    required this.cislo,
    required this.mesto,
    required this.psc,
    required this.kod,
    this.tel,
    this.email,
    this.web,
  });

  factory StoreCasist.fromDomain(Store store) => StoreCasist(
    id: store.id,
    prevadzka: store.prevadzka,
    ulica: store.ulica,
    cislo: store.cislo,
    mesto: store.mesto,
    psc: store.psc,
    kod: store.kod
  );

  factory StoreCasist.fromJson(Map<String, dynamic> json) => StoreCasist(
    id: json["id"],
    prevadzka: json["prevadzka"],
    ulica: json["ulica"],
    cislo: json["cislo"],
    mesto: json["mesto"],
    psc: json["psc"],
    kod: json["kod"],
    tel: json["tel"],
    email: json["email"],
    web: json["web"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prevadzka": prevadzka,
    "ulica": ulica,
    "cislo": cislo,
    "mesto": mesto,
    "psc": psc,
    "kod": kod,
    "tel": tel,
    "email": email,
    "web": web,
  };
}

extension StoreX on StoreCasist {
  Store toDomain() {
    return Store(
      id: id,
      prevadzka: prevadzka,
      ulica: ulica,
      cislo: cislo,
      mesto: mesto,
      psc: psc,
      kod: kod
    );
  }
}