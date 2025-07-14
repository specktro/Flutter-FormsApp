import 'package:formz/formz.dart';

enum EmailInputError { empty, format }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty([String value = '']) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) {
      return null;
    }

    if (displayError == EmailInputError.empty) {
      return 'Email cannot be empty';
    } else if (displayError == EmailInputError.format) {
      return 'Email is not in a valid format';
    } else {
      return 'Invalid email';
    }
  }

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return EmailInputError.empty;
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return EmailInputError.format;
    }

    return null;
  }
}
