import 'dart:async';

import 'package:casist2/presentation/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class AutocompleteInputField<T extends Object> extends StatelessWidget {
  final FutureOr<Iterable<T>> Function(TextEditingValue) _optionsBuilder;
  final void Function(T)? _onSelected;
  final String Function(T) _displayStringForOption;

  const AutocompleteInputField({
    super.key,
    required FutureOr<Iterable<T>> Function(TextEditingValue) optionsBuilder,
    required void Function(T)? onSelected,
    required String Function(T) displayStringForOption,
  }): _optionsBuilder = optionsBuilder,
      _onSelected = onSelected,
      _displayStringForOption = displayStringForOption;


  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: key,
      child: Autocomplete(
        optionsMaxHeight: 300,
        optionsBuilder: _optionsBuilder,
        onSelected: _onSelected,
        displayStringForOption: _displayStringForOption,
        fieldViewBuilder: (
        BuildContext context,
        TextEditingController fieldTextEditingController,
        FocusNode fieldFocusNode,
        VoidCallback onFieldSubmitted
        ) {
          return TextField(
            controller: fieldTextEditingController,
            focusNode: fieldFocusNode,
            cursorColor: Colors.black12,
            decoration: const InputDecoration(
              focusColor: Colors.black,
              border: InputBorder.none,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white10),
              ),
            ),
          );
        }
      )
    );
  }
}