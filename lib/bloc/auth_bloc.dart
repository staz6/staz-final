// blocs/authentication_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class LogoutEvent extends AuthenticationEvent {}

class AuthenticationBloc extends Bloc<AuthenticationEvent, User?> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthenticationBloc() : super(null) {
    on<LoginEvent>((event, emit) async {
      try {
        UserCredential userCredential =
            await _firebaseAuth.signInWithEmailAndPassword(
                email: event.email, password: event.password);
        print(userCredential);
        emit(userCredential.user);
      } catch (e) {
        print('Login error: $e');
        emit(null);
      }
    });

    on<LogoutEvent>((event, emit) async {
      await _firebaseAuth.signOut();
      emit(null);
    });
  }
}
