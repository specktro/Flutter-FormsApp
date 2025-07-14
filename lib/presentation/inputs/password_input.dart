import 'package:formz/formz.dart';

enum PasswordInputError { empty, length }

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty([String value = '']) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) {
      return null;
    }

    if (displayError == PasswordInputError.empty) {
      return 'Password cannot be empty';
    } else if (displayError == PasswordInputError.length) {
      return 'Password must be at least 8 characters long';
    } else {
      return 'Invalid password';
    }
  }

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return PasswordInputError.empty;
    }

    if (value.length < 8) {
      return PasswordInputError.length;
    }

    return null;
  }
}
