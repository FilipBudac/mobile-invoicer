import 'package:casist2/presentation/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  final String? _hintText;
  final String _labelText;
  final bool _obscureText;
  final IconData? _icon;
  final TextStyle? _fieldStyle;
  final TextEditingController? _controller;
  final void Function(String)? _onChanged;
  final void Function()? _onTap;
  final String? Function(String?)? _validator;

  const FormInputField({
    super.key,
    required String labelText,
    TextStyle? fieldStyle,
    String? Function(String?)? validator,
    TextEditingController? controller,
    IconData? icon,
    String? hintText,
    void Function(String)? onChanged,
    void Function()? onTap,
    bool obscureText = false,
  }): _hintText = hintText,
      _labelText = labelText,
      _obscureText = obscureText,
      _icon = icon,
      _fieldStyle = fieldStyle,
      _validator = validator,
      _controller = controller,
      _onChanged = onChanged,
      _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: key,
      child: TextFormField(
        controller: _controller,
        style: _fieldStyle,
        onChanged: _onChanged,
        validator: _validator ?? (val) { return val; },
        onTap: _onTap,
        cursorColor: Colors.black12,
        obscureText: _obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(_icon, color: Colors.black),
          errorMaxLines: 2,
          labelText: _labelText,
          labelStyle: const TextStyle(color: Colors.black),
          hintText: _hintText,
          focusColor: Colors.black,
          border: InputBorder.none,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white10),
          ),
        ),
      ),
    );
  }
}