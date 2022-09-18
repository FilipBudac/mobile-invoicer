import 'package:casist2/data/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({
    super.key,
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("HOOOME")),
    );
  }


}