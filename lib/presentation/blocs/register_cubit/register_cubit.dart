import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/presentation/inputs/email_input.dart';
import 'package:forms_app/presentation/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() async {
    emit(
      state.copyWith(
        status: FormStatus.validating,
        username: UsernameInput.dirty(state.username.value),
        password: PasswordInput.dirty(state.password.value),
        email: EmailInput.dirty(state.email.value),
        isValid: Formz.validate([state.username, state.password]),
      ),
    );
    print('Submit: $state');
  }

  void updateUsername(String value) {
    final username = UsernameInput.dirty(value);
    emit(
      state.copyWith(
        isValid: Formz.validate([username, state.password, state.email]),
        username: username,
      ),
    );
  }

  void updateEmail(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        isValid: Formz.validate([email, state.username, state.password]),
        email: email,
      ),
    );
  }

  void updatePassword(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(
        isValid: Formz.validate([password, state.username, state.email]),
        password: password,
      ),
    );
  }
}
