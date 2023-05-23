import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import './bloc/auth_bloc.dart';
import 'screens/login_screen.dart';
import 'layout/layout_screen.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(),
        child: LayoutPage(),
      ),
    );
  }
}
