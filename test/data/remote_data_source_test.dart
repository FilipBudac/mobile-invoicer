import 'dart:convert';
import 'dart:io';
import 'package:casist2/core/config.dart';
import 'package:casist2/data/casist_api_client.dart';
import 'package:casist2/data/data_sources/remote_data_source.dart';
import 'package:casist2/data/models/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../resources/fixture_reader.dart';

class MockCasistApiClient extends Mock implements CasistApiClient {}

void main() {
  late MockCasistApiClient mockCasistApiClient;
  late Casist2Api remoteSource;

  setUp(() {
    mockCasistApiClient = MockCasistApiClient();
    remoteSource = Casist2Api(
      client: mockCasistApiClient,
    );
  });

  group("test authentication repository", () {
    test("a user should authenticate", () async {
      final params = {
        "grant_type": "password",
        "client_id": clientId,
        "username": "demo",
        "password": "demo"
      };
      final headers = {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.contentTypeHeader: "application/json"
      };
      final user = await fixtureAsString("user.json");
      when(
        mockCasistApiClient.post(
          "/api/login",
          headers: headers,
          params: params
        )
      ).thenAnswer(
        (_) async => Response(user, 200)
      );

      final result = await remoteSource.authenticate(username: "demo", password: "demo");

      verify(
        mockCasistApiClient.post(
            "/api/login",
            headers: headers,
            params: params
        )
      );
      expect(result, equals(
        User.fromJson(
          json.decode(user)
        )
      ));
    });

    test("a user should not authenticate if the credentials are invalid", () async {
      final params = {
        "grant_type": "password",
        "client_id": clientId,
        "username": "",
        "password": ""
      };
      final headers = {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.contentTypeHeader: "application/json"
      };
      when(
        mockCasistApiClient.post(
            "/api/login",
            headers: headers,
            params: params
        )
      ).thenAnswer(
        (_) async => Response("", 500)
      );

      final result = await remoteSource.authenticate(username: "demo", password: "demo");

      expect(result, equals(null));
    });

    test("a user should not authenticate if an exception is thrown", () async {
      final params = {
        "grant_type": "password",
        "client_id": clientId,
        "username": "",
        "password": ""
      };
      final headers = {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.contentTypeHeader: "application/json"
      };
      when(
          mockCasistApiClient.post(
              "/api/login",
              headers: headers,
              params: params
          )
      ).thenThrow(ArgumentError());

      final result = await remoteSource.authenticate(username: "demo", password: "demo");

      expect(result, equals(null));
    });
  });
}