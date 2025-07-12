import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New User')),
      body: const _RegisterView(),
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

              SizedBox(height: 20)
            ],
          ),
        ),
      )
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            onChanged: (value) => username = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'Username is required';
              }

              if (value.length < 6) {
                return 'Username must be at least 6 characters long';
              }

              return null;
            },
            label: 'Username',
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            onChanged: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'Email is required';
              }

              final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$');

              if (!emailRegex .hasMatch(value)) {
                return 'Please enter a valid email address';
              }

              return null;
            },
            label: 'Email',
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            onChanged: (value) => password = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'Password is required';
              }

              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }

              return null;
            },
            label: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
              onPressed: () {
                bool? isValid = _formKey.currentState?.validate();

                if (isValid == null || !isValid) {
                  return;
                }

                print('$username - $email - $password');
              },
              icon: const Icon(Icons.save),
              label: const Text('Sign Up')
          ),
        ],
      )
    );
  }
}