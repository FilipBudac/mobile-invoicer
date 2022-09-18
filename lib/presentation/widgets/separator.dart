import 'package:flutter/cupertino.dart';

class Separator extends StatelessWidget {
  final double? _width;
  final double? _height;

  const Separator({
      super.key,
      double? width,
      double? height,
    }
  ): _width = width, _height = height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: _height ?? 0, width: _width ?? 0);
  }
}
