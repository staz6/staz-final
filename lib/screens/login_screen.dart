// screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../helper/constraint.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor[0],
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value == null || !value.isValidEmail()) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bloc.add(LoginEvent(email: _emailController.text, password: _passwordController.text));
                  }
                },
                child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
