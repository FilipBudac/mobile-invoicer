import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget _child;

  const TextFieldContainer({
    super.key,
    required Widget child,
  }): _child = child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
        border: Border.all(color: Colors.black)
      ),
      child: _child,
    );
  }
}