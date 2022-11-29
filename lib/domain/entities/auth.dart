class Auth {
  final String accessToken;
  final String refreshToken;
  final String scope;

  Auth({
    required this.accessToken,
    required this.refreshToken,
    required this.scope
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    scope: json["scope"],
  );
}