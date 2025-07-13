part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus status;
  final String username;
  final String email;
  final String password;

  const RegisterFormState({
    this.status = FormStatus.invalid,
    this.username = '',
    this.email = '',
    this.password = '',
  });

  RegisterFormState copyWith({
    FormStatus? status,
    String? username,
    String? email,
    String? password,
  }) {
    return RegisterFormState(
      status: status ?? this.status,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [status, username, email, password];
}
