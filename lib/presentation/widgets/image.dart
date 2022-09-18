import 'package:casist2/core/themes.dart';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final double _width;
  final double _height;

  const RoundedImage({
    super.key,
    required double width,
    required double height
  }): _width = width, _height = height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(150.0)
        ),
        color: Casist2Theme.secondaryColor,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 45, 10, 30),
          child: Image.asset('assets/images/casist_logo.png'),
        ),
      ),
    );
  }
}
