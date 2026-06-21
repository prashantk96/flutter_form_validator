import 'package:flutter_form_validator/src/core/validation_messages.dart';

class CvvValidator {
  static String? validate(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return ValidationMessages.get('required');
    }

    if (!RegExp(r'^\d{3,4}$').hasMatch(value)) {
      return ValidationMessages.get('invalid_cvv');
    }

    return null;
  }
}
