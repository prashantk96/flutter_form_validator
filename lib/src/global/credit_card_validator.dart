import 'package:flutter_form_validator/src/core/validation_messages.dart';

class CreditCardValidator {
  /// Validates credit/debit card number using Luhn algorithm.
  static String? validate(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return ValidationMessages.get('required');
    }

    final cardNumber = value.replaceAll(' ', '');

    if (!RegExp(r'^\d{13,19}$').hasMatch(cardNumber)) {
      return ValidationMessages.get('invalid_credit_card');
    }

    int sum = 0;
    bool alternate = false;

    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int n = int.parse(cardNumber[i]);

      if (alternate) {
        n *= 2;

        if (n > 9) {
          n -= 9;
        }
      }

      sum += n;
      alternate = !alternate;
    }

    return sum % 10 == 0 ? null : message ?? 'Invalid card number';
  }
}
