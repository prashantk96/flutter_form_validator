import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_validator/flutter_form_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Field Validator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ValidatorDemoPage(),
    );
  }
}

class ValidatorDemoPage extends StatefulWidget {
  const ValidatorDemoPage({super.key});

  @override
  State<ValidatorDemoPage> createState() => _ValidatorDemoPageState();
}

class _ValidatorDemoPageState extends State<ValidatorDemoPage> {
  final _formKey = GlobalKey<FormState>();

  ValidationLocale locale = ValidationLocale.english;

  @override
  Widget build(BuildContext context) {
    ValidatorLocale.current = locale;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Field Validator',
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Language',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              SegmentedButton<ValidationLocale>(
                segments: const [
                  ButtonSegment(
                    value: ValidationLocale.english,
                    label: Text('English'),
                  ),
                  ButtonSegment(
                    value: ValidationLocale.hindi,
                    label: Text('Hindi'),
                  ),
                ],
                selected: {locale},
                onSelectionChanged: (value) {
                  setState(() {
                    locale = value.first;
                  });

                  _formKey.currentState?.validate();
                },
              ),
              const SizedBox(height: 24),
              _title(
                'Global Validators',
              ),
              _field(
                label: 'Email',
                validator: Validators.email,
                formatters: [
                  ValidatorInputFormatters.email,
                ],
              ),
              _field(
                label: 'Mobile',
                validator: Validators.mobile,
                keyboardType: TextInputType.phone,
                formatters: ValidatorInputFormatters.mobileFormatters,
              ),
              _field(
                label: 'Password',
                validator: Validators.password,
              ),
              _field(
                label: 'URL',
                validator: Validators.url,
              ),
              _field(
                label: 'Credit Card',
                validator: Validators.creditCard,
              ),
              _field(
                label: 'CVV',
                validator: Validators.cvv,
              ),
              _field(
                label: 'Expiry MM/YY',
                validator: Validators.expiryDate,
              ),
              const SizedBox(
                height: 24,
              ),
              _title(
                'Formatter Examples',
              ),
              _field(
                label: 'Name (Alphabets)',
                formatters: [
                  ValidatorInputFormatters.alphabetsWithSpaces,
                  ValidatorInputFormatters.titleCase,
                ],
              ),
              _field(
                label: 'Numbers Only',
                keyboardType: TextInputType.number,
                formatters: [
                  ValidatorInputFormatters.numbersOnly,
                ],
              ),
              _field(
                label: 'No Special Characters',
                formatters: [
                  ValidatorInputFormatters.noSpecialCharacters,
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              _title(
                'India Validators',
              ),
              _field(
                label: 'PAN',
                validator: IndianValidators.pan,
                formatters: ValidatorInputFormatters.panFormatters,
              ),
              _field(
                label: 'Aadhaar',
                validator: IndianValidators.aadhaar,
                keyboardType: TextInputType.number,
                formatters: ValidatorInputFormatters.aadhaarFormatters,
              ),
              _field(
                label: 'GST',
                validator: IndianValidators.gst,
                formatters: ValidatorInputFormatters.gstFormatters,
              ),
              _field(
                label: 'IFSC',
                validator: IndianValidators.ifsc,
                formatters: ValidatorInputFormatters.ifscFormatters,
              ),
              _field(
                label: 'UPI',
                validator: IndianValidators.upi,
                formatters: ValidatorInputFormatters.upiFormatters,
              ),
              _field(
                label: 'Pincode',
                validator: IndianValidators.pincode,
                keyboardType: TextInputType.number,
                formatters: ValidatorInputFormatters.pincodeFormatters,
              ),
              _field(
                label: 'Passport',
                validator: IndianValidators.passport,
                formatters: ValidatorInputFormatters.passportFormatters,
              ),
              _field(
                label: 'Voter ID',
                validator: IndianValidators.voterId,
                formatters: ValidatorInputFormatters.voterIdFormatters,
              ),
              const SizedBox(
                height: 24,
              ),
              _title(
                'USA Validators',
              ),
              _field(
                label: 'SSN',
                validator: USValidators.ssn,
                formatters: [
                  ValidatorInputFormatters.ssn,
                  ValidatorInputFormatters.ssnLength,
                ],
              ),
              _field(
                label: 'ZIP Code',
                validator: USValidators.zipCode,
                formatters: [
                  ValidatorInputFormatters.zipCode,
                  ValidatorInputFormatters.zipCodeLength,
                ],
              ),
              _field(
                label: 'EIN',
                validator: USValidators.ein,
                formatters: [
                  ValidatorInputFormatters.ein,
                  ValidatorInputFormatters.einLength,
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              _title(
                'UK Validators',
              ),
              _field(
                label: 'Postcode',
                validator: UKValidators.postcode,
              ),
              _field(
                label: 'NINO',
                validator: UKValidators.nino,
                formatters: [
                  ValidatorInputFormatters.nino,
                  ValidatorInputFormatters.ninoLength,
                ],
              ),
              _field(
                label: 'UTR',
                validator: UKValidators.utr,
                keyboardType: TextInputType.number,
                formatters: [
                  ValidatorInputFormatters.utr,
                  ValidatorInputFormatters.utrLength,
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Validation Success',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Validate',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _field({
    required String label,
    String? Function(String?)? validator,
    List<TextInputFormatter>? formatters,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        inputFormatters: formatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}
