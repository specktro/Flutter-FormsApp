import 'package:formz/formz.dart';

enum PasswordInputError { empty, length }

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty([String value = '']) : super.dirty(value);

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
