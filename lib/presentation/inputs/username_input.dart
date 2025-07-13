import 'package:formz/formz.dart';

enum UsernameInputError {
  empty, 
  length
}

class UsernameInput extends FormzInput<String, UsernameInputError> {
  const UsernameInput.pure() : super.pure('');

  const UsernameInput.dirty([String value = '']) : super.dirty(value);

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