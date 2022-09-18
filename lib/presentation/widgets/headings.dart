import 'package:casist2/core/themes.dart';
import 'package:flutter/cupertino.dart';

class Heading2 extends StatelessWidget {
  final String _text;
  final Color? _color;
  final FontWeight? _bold;

  const Heading2(
    String text, {
    super.key,
    Color? color,
    FontWeight? bold,
  }): _text = text,
      _color = color,
      _bold = bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        fontSize: 22,
        color: _color ?? Casist2Theme.textColor,
        fontWeight: _bold ?? FontWeight.normal
      )
    );
  }
}

class Heading1 extends StatelessWidget {
  final String _text;
  final Color? _color;
  final FontWeight? _bold;

  const Heading1(
    String text, {
    super.key,
    Color? color,
    FontWeight? bold,
  }): _text = text,
    _color = color,
    _bold = bold;


  @override
  Widget build(BuildContext context) {
    return Text(
        _text,
        style: TextStyle(
            fontSize: 30,
            color: _color ?? Casist2Theme.textColor,
            fontWeight: _bold ?? FontWeight.normal
        )
    );
  }
}

