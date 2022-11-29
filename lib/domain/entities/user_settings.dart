class UserSettings {
  final int id;
  final int sd1;
  final int sd2;
  final String mena;
  final String menaShort;
  final String textFa;

  UserSettings({
    required this.id,
    required this.sd1,
    required this.sd2,
    required this.mena,
    required this.menaShort,
    required this.textFa
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) => UserSettings(
    id: json["id"],
    sd1: json["sd1"],
    sd2: json["sd2"],
    mena: json["mena"],
    menaShort: json["mena_short"],
    textFa: json["text_fa"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sd1": sd1,
    "sd2": sd2,
    "mena": mena,
    "mena_short": menaShort,
    "text_fa": textFa,
  };
}

