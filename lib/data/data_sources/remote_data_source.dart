import 'dart:convert';
import 'dart:io';
import 'package:casist2/core/error/exceptions.dart';
import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/company.dart';
import 'package:casist2/data/models/user.dart';
import 'package:casist2/core/config.dart';

import '../casist_api_client.dart';

abstract class RemoteDataSource {

  Future<User> authenticate({required String username, required String password});
  Future<List<Company>> searchCompanies({required Agenda agenda});

}

class Casist2Api implements RemoteDataSource {
  final CasistApiClient _client;

  Casist2Api({
    required CasistApiClient client
  }): _client = client;

  @override
  Future<User> authenticate({
    required String username,
    required String password
  }) async {
    final params = {
      "grant_type": "password",
      "client_id": clientId,
      "username": username,
      "password": password
    };
    final headers = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json"
    };
    final response = await _client.post("/api/login", headers: headers, params: params);
    if (HttpStatus.ok != response.statusCode) {
      throw RequestFailed();
    }
    return User.fromJson(
      json.decode(utf8.decode(response.bodyBytes))
    );
  }

  @override
  Future<List<Company>> searchCompanies({
    required Agenda agenda,
  }) async {
    final params = {
      "agenda": agenda.id.toString()
    };
    final headers = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json"
    };
    final response = await _client.get("/api/firmy", params: params, headers: headers);
    if (HttpStatus.ok != response.statusCode) {
      throw RequestFailed();
    }
    final decodedResponse = json.decode(
      utf8.decode(response.bodyBytes)
    );
    return List<Company>.from(decodedResponse["results"].map(
      (company) => Company.fromJson(company))
    );
  }
}