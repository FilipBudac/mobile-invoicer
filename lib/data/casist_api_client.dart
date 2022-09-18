import 'dart:convert';
import 'dart:io';
import 'package:casist2/core/config.dart';
import 'package:casist2/core/error/exceptions.dart';
import 'package:casist2/core/http_method.dart';
import 'package:casist2/data/models/auth.dart';
import 'package:casist2/data/models/casist_request.dart';
import 'package:casist2/data/storage/secure_storage.dart';
import 'package:http/http.dart';

class CasistApiClient {
  final Client _client;
  final Storage _storage;

  CasistApiClient({
    required Client client,
    required Storage storage,
  }): _client = client, _storage = storage;

  Future<Response> get(
    String resourcePath, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  }) async => _createRequest(
    method: HttpMethod.GET,
    resourcePath: resourcePath,
    headers: headers,
    params: params,
  );

  Future<Response> post(
    String resourcePath, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Object? body,
    Encoding? encoding,
  }) async => await _createRequest(
    method: HttpMethod.POST,
    resourcePath: resourcePath,
    headers: headers,
    params: params,
    body: body,
    encoding: encoding,
  );

  Future<Response> put(
    String resourcePath, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Object? body,
    Encoding? encoding,
  }) async => await _createRequest(
    method: HttpMethod.PUT,
    resourcePath: resourcePath,
    headers: headers,
    params: params,
    body: body,
    encoding: encoding,
  );

  Future<Response> patch(
    String resourcePath, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Object? body,
    Encoding? encoding,
  }) async => await _createRequest(
    method: HttpMethod.PATCH,
    resourcePath: resourcePath,
    headers: headers,
    params: params,
    body: body,
    encoding: encoding,
  );

  Future<Response> delete(
    String resourcePath, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Object? body,
    Encoding? encoding,
  }) async => await _createRequest(
    method: HttpMethod.DELETE,
    resourcePath: resourcePath,
    headers: headers,
    params: params,
    body: body,
    encoding: encoding,
  );

  Future<String> _getToken() async {
   final user = await _storage.getUser();
    if (user == null) {
      throw RuntimeError("User has to be stored.");
    }
    return user.auth.accessToken;
  }

  Future<void> _refreshToken() async {
    final user = await _storage.getUser();
    if (user == null) {
      throw RuntimeError("User has to be stored.");
    }
    final params = {
      "grant_type": "refresh_token",
      "refresh_token": user.auth.refreshToken,
      "old_token": user.auth.accessToken,
      "client_id": clientId,
    };

    final Uri uri = Uri.https(authorityUrl, "/api/oauth2/token/", params);

    final headers = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
    };

    final response = await _client.post(uri, headers: headers);

    user.auth = Auth.fromJson(
      json.decode(utf8.decode(response.bodyBytes))
    );
    await _storage.cacheUser(user);
  }

  Future<Response> _attemptRequest(CasistRequest request) async {
    final token = await _getToken();

    request.headers[HttpHeaders.authorizationHeader] = "Bearer $token";

    final response = await Response.fromStream(
        await _client.send(request)
    );
    if (response.statusCode == HttpStatus.forbidden) {
      throw RequestUnauthorized();
    }
    return response;
  }

  Future<Response> _createRequest({
    required HttpMethod method,
    required String resourcePath,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Object? body,
    Encoding? encoding,
}) async {
    CasistRequest request = CasistRequest.create(
      resourcePath, method,
      encoding: encoding,
      body: body,
      headers: headers,
      params: params
    );
    try {
      return await _attemptRequest(request);
    } on RequestUnauthorized {
      await _refreshToken();
      request = CasistRequest.create(
        resourcePath, method,
        encoding: encoding,
        body: body,
        headers: headers,
        params: params
      );
      return await _attemptRequest(request);
    } catch (_) {
      // TODO: runtime error, navigate to sign in page
      rethrow;
    }
  }
}