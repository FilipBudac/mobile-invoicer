// ignore_for_file: constant_identifier_names
enum HttpMethod {
  HEAD,
  GET,
  POST,
  PUT,
  PATCH,
  DELETE,
}

extension MethodToString on HttpMethod {
  String get asString {
    switch (this) {
      case HttpMethod.HEAD:
        return "HEAD";
      case HttpMethod.GET:
        return "GET";
      case HttpMethod.POST:
        return "POST";
      case HttpMethod.PUT:
        return "PUT";
      case HttpMethod.PATCH:
        return "PATCH";
      case HttpMethod.DELETE:
        return "DELETE";
    }
  }
}
