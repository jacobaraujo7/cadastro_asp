import 'package:flutter/material.dart';

import '../exceptions/validate_exception.dart';

class TextInput extends StatelessWidget {
  final String? initialValue;
  final void Function(String value)? validator;
  final String? hint;
  final bool enabled;
  final void Function(String value)? onChanged;

  const TextInput({
    super.key,
    this.enabled = true,
    this.initialValue,
    this.validator,
    this.hint,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      autovalidateMode: AutovalidateMode.always,
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
      ),
      validator: (name) {
        try {
          validator?.call(name ?? '');
          return null;
        } on ValidateException catch (e) {
          return e.message;
        }
      },
    );
  }
}
