class Store {
  final int id;
  final String prevadzka;
  final String ulica;
  final String cislo;
  final String mesto;
  final String psc;
  final String kod;

  Store({
    required this.id,
    required this.prevadzka,
    required this.ulica,
    required this.cislo,
    required this.mesto,
    required this.psc,
    required this.kod,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    prevadzka: json["prevadzka"],
    ulica: json["ulica"],
    cislo: json["cislo"],
    mesto: json["mesto"],
    psc: json["psc"],
    kod: json["kod"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prevadzka": prevadzka,
    "ulica": ulica,
    "cislo": cislo,
    "mesto": mesto,
    "psc": psc,
    "kod": kod,
  };
}