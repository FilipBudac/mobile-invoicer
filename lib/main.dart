import 'package:casist2/core/boostrap.dart' as boostrap;
import 'package:casist2/core/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await boostrap.init();
  runApp(const Casist2App());
}
