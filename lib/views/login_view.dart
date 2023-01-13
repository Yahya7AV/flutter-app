﻿import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taosil/constants/routes.dart';
import 'package:taosil/services/auth/auth_exceptions.dart';
import 'package:taosil/services/auth/bloc/auth_bloc.dart';
import 'package:taosil/services/auth/bloc/auth_event.dart';
import 'package:taosil/utilities/dialogs/error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  //late: promise to assign a value to the variable in the future
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController(); //proxy-like channel
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Column(
        children: [
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "E-mail",
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Password",
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                context.read<AuthBloc>().add(AuthEventLogIn(email, password));
              } on UserNotFoundAuthException {
                await showErrorDialog(context, "User is not found!");
              } on WrongPasswordAuthException {
                await showErrorDialog(
                    context, "Email or Password is Incorrect");
              } on GenericAuthException {
                await showErrorDialog(context, 'Authentication Error');
              }
            },
            child: const Text("Login"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text("Don't have an account? Register here!"),
          )
        ],
      ),
    );
  }
}
