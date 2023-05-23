import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import './bloc/auth_bloc.dart';
import './bloc/friend_add_edit_bloc.dart';
import './bloc/repository.dart';
import 'screens/login_screen.dart';
import 'layout/layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repository = Repository();
    return MaterialApp(
      title: 'My Flutter App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(),
          ),
          BlocProvider<FriendBloc>(
            create: (context) => FriendBloc(repository: repository),
          ),
        ],
        child: LayoutPage(),
      ),
    );
  }
}
