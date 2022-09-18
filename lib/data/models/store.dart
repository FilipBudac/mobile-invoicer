class Store {
  final int id;
  final String prevadzka;
  final String ulica;
  final String cislo;
  final String mesto;
  final String psc;
  final String kod;
  final String tel;
  final String email;
  final String web;
  final String recordCreated;

  Store({
    required this.id,
    required this.prevadzka,
    required this.ulica,
    required this.cislo,
    required this.mesto,
    required this.psc,
    required this.kod,
    required this.tel,
    required this.email,
    required this.web,
    required this.recordCreated
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
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
    recordCreated: json["record_created"],
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
    "record_created": recordCreated,
  };

  @override
  String toString() {
    return 'Store{id: $id, prevadzka: $prevadzka, ulica: $ulica, cislo: $cislo, mesto: $mesto, psc: $psc, kod: $kod, tel: $tel, email: $email, web: $web, record_created: $recordCreated}';
  }
}