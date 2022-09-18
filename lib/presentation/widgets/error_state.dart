import 'package:flutter/cupertino.dart';

class ErrorStateView extends StatelessWidget {
  const ErrorStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Wrong state!")
    );
  }
}
