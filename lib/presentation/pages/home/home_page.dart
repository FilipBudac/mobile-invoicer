import 'package:casist2/domain/entities/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User _user;

  const HomePage(User user, {
    super.key
  }): _user = user;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("HOOOME")),
    );
  }


}