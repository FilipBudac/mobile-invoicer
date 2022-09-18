import 'package:casist2/core/routes_generator.dart';
import 'package:casist2/core/themes.dart';
import 'package:flutter/material.dart';

class Casist2App extends StatelessWidget {
  const Casist2App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casist2 App',
      theme: Casist2Theme.light,
      darkTheme: Casist2Theme.dark,
      onGenerateRoute: RoutesNavigator.generate,
      navigatorKey: RoutesNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
