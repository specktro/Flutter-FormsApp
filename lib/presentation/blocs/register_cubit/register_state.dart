part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus status;
  final bool isValid;
  final UsernameInput username;
  final EmailInput email;
  final PasswordInput password;

  const RegisterFormState({
    this.status = FormStatus.invalid,
    this.isValid = false,
    this.username = const UsernameInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? status,
    bool? isValid,
    UsernameInput? username,
    EmailInput? email,
    PasswordInput? password,
  }) {
    return RegisterFormState(
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [status, isValid, username, email, password];
}
