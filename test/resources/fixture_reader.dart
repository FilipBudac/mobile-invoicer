import 'dart:convert';
import 'dart:io';
import 'package:casist2/data/models/user.dart';

List<int> fixture(String name) => File('test/resources/$name').readAsBytesSync();
Future<String> fixtureAsString(String name) async => File('test/resources/$name').readAsString();

User getMockerUser() {
  List<int> response = fixture("user.json");
  return User.fromJson(
      json.decode(utf8.decode(response))
  );
}