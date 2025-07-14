import 'package:formz/formz.dart';

enum UsernameInputError { empty, length }

class UsernameInput extends FormzInput<String, UsernameInputError> {
  const UsernameInput.pure() : super.pure('');

  const UsernameInput.dirty([String value = '']) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) {
      return null;
    }

    if (displayError == UsernameInputError.empty) {
      return 'Username cannot be empty';
    } else if (displayError == UsernameInputError.length) {
      return 'Username must be at least 6 characters long';
    } else {
      return 'Invalid username';
    }
  }

  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return UsernameInputError.empty;
    }

    if (value.length < 6) {
      return UsernameInputError.length;
    }

    return null;
  }
}
