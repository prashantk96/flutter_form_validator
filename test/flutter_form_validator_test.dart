import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form_validator/flutter_form_validator.dart';

void main() {
  group('Email Validator', () {
    test('Valid Email', () {
      expect(Validators.email('test@gmail.com'), null);
    });

    test('Invalid Email', () {
      expect(Validators.email('abc'), isNotNull);
    });
  });

  group('PAN Validator', () {
    test('Valid PAN', () {
      expect(IndianValidators.pan('ABCDE1234F'), null);
    });

    test('Invalid PAN', () {
      expect(IndianValidators.pan('12345'), isNotNull);
    });
  });
}
