# Flutter Field Validator

A powerful Flutter validation package with built-in validators, localization support, and input formatters.

## Features

✅ Global Validators

* Email
* Mobile Number
* Password
* URL
* Credit Card
* CVV
* Expiry Date

✅ India Validators

* PAN
* Aadhaar
* GST
* IFSC
* UPI
* PIN Code
* Passport
* Voter ID
* Vehicle Number
* Driving License
* Bank Account

✅ USA Validators

* SSN
* ZIP Code
* EIN
* Phone Number

✅ UK Validators

* Postcode
* NINO
* UTR
* Phone Number

✅ Input Formatters

* Numbers Only
* Alphabets Only
* Alphanumeric
* No Spaces
* No Special Characters
* Email
* Website
* PAN Formatter
* Aadhaar Formatter
* GST Formatter
* IFSC Formatter
* UPI Formatter
* Length Limit Formatters

✅ Localization

* English
* Hindi

## Installation

Add dependency:

```yaml
dependencies:
  flutter_form_validator: ^1.0.0
```

Run:

```bash
flutter pub get
```

## Import

```dart
import 'package:flutter_form_validator/flutter_form_validator.dart';
```

## Usage

### Email Validation

```dart
TextFormField(
  validator: Validators.email,
)
```

### Mobile Validation

```dart
TextFormField(
  validator: Validators.mobile,
)
```

### PAN Validation

```dart
TextFormField(
  validator: IndianValidators.pan,
)
```

### Aadhaar Validation

```dart
TextFormField(
  validator: IndianValidators.aadhaar,
)
```

### SSN Validation

```dart
TextFormField(
  validator: USValidators.ssn,
)
```

### UK Postcode Validation

```dart
TextFormField(
  validator: UKValidators.postcode,
)
```

## Input Formatters

### PAN Formatter

```dart
TextFormField(
  inputFormatters:
      ValidatorInputFormatters.panFormatters,
)
```

### Mobile Formatter

```dart
TextFormField(
  inputFormatters:
      ValidatorInputFormatters.mobileFormatters,
)
```

### Aadhaar Formatter

```dart
TextFormField(
  inputFormatters:
      ValidatorInputFormatters.aadhaarFormatters,
)
```

## Localization

Switch language dynamically:

```dart
ValidatorLocale.current =
    ValidationLocale.hindi;
```

Back to English:

```dart
ValidatorLocale.current =
    ValidationLocale.english;
```

## Example

See the example application included with the package.

## Contributing

Contributions, issues and feature requests are welcome.

## License

MIT License.
