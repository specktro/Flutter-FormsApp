import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New User')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            onChanged: (value) => registerCubit.updateUsername(value),
            errorText: username.errorMessage,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            onChanged: (value) {
              registerCubit.updateEmail(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'Email is required';
              }

              final emailRegex = RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$',
              );

              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email address';
              }

              return null;
            },
            label: 'Email',
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Password',
            onChanged: (value) => registerCubit.updatePassword(value),
            errorText: password.errorMessage,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
