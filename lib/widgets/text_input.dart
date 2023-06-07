import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../exceptions/validate_exception.dart';

class TextInput extends StatelessWidget {
  final String? initialValue;
  final Result<Unit, AppException> Function(String value)? validator;
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
        return validator
            ?.call(name ?? '') //
            .fold(
              (success) => null,
              (failure) => failure.message,
            );
      },
    );
  }
}
