import 'package:flutter_form_validator/src/core/validation_messages.dart';

class ExpiryDateValidator {
  static String? validate(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return ValidationMessages.get('required');
    }

    if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(value)) {
      return ValidationMessages.get('invalid_expiry_date');
    }

    final parts = value.split('/');

    final month = int.parse(parts[0]);

    final year = 2000 + int.parse(parts[1]);

    final now = DateTime.now();

    final expiry = DateTime(year, month + 1, 0);

    if (expiry.isBefore(now)) {
      return ValidationMessages.get('card_expired');
    }

    return null;
  }
}
