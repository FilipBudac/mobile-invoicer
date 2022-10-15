import 'dart:convert';

import 'package:casist2/core/config.dart';
import 'package:casist2/core/http_method.dart';
import 'package:http/http.dart';

class CasistRequest extends Request {
  CasistRequest(super.method, super.url);

  factory CasistRequest.create(
    String resourcePath,
    HttpMethod method, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Object? body,
    Encoding? encoding,
  }) {
    final uri = Uri.https(authorityUrl, resourcePath, params);
    final request = CasistRequest(method.asString, uri);
    if (headers != null) {
      request.headers.addAll(headers);
    }
    if (encoding != null) {
      request.encoding = encoding;
    }
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError("Invalid request body $body");
      }
    }
    return request;
  }
}
