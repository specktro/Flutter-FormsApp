import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/presentation/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Submit: $state');
  }

  void updateUsername(String value) {
    final username = UsernameInput.dirty(value);
    emit(
      state.copyWith(
        isValid: Formz.validate([username, state.password]),
        username: username,
      ),
    );
  }

  void updateEmail(String value) {
    emit(state.copyWith(email: value));
  }

  void updatePassword(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(
        isValid: Formz.validate([password, state.username]),
        password: password,
      ),
    );
  }
}
