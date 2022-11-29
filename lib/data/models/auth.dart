import 'package:casist2/domain/entities/auth.dart';

class AuthCasist {
  final String accessToken;
  final String refreshToken;
  final String scope;

  AuthCasist({
    required this.accessToken,
    required this.refreshToken,
    required this.scope
  });

  factory AuthCasist.fromDomain(Auth auth) => AuthCasist(
    accessToken: auth.accessToken,
    refreshToken: auth.refreshToken,
    scope: auth.scope
  );

  factory AuthCasist.fromJson(Map<String, dynamic> json) => AuthCasist(
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    scope: json["scope"],
  );
}

extension AuthX on AuthCasist {
  Auth toDomain() {
    return Auth(
      accessToken: accessToken,
      refreshToken: refreshToken,
      scope: scope
    );
  }
}