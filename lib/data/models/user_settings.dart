import 'package:casist2/domain/entities/user_settings.dart';

class UserSettingsCasist {
  final int id;
  final int sd1;
  final int sd2;
  final String mena;
  final String menaShort;
  final String textFa;

  UserSettingsCasist({
    required this.id,
    required this.sd1,
    required this.sd2,
    required this.mena,
    required this.menaShort,
    required this.textFa
  });

  factory UserSettingsCasist.fromDomain(UserSettings settings) => UserSettingsCasist(
      id: settings.id,
      sd1: settings.sd1,
      sd2: settings.sd2,
      mena: settings.mena,
      menaShort: settings.menaShort,
      textFa: settings.textFa
  );

  factory UserSettingsCasist.fromJson(Map<String, dynamic> json) => UserSettingsCasist(
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

extension UserSettingX on UserSettingsCasist {
  UserSettings toDomain() {
    return UserSettings(
        id: id,
        sd1: sd1,
        sd2: sd2,
        mena: mena,
        menaShort: menaShort,
        textFa: textFa
    );
  }
}

