import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());
  final _auth = FirebaseAuth.instance;
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is OnPressedLoginButtonEvent) {
      yield LoginInProgress();
      try {
        final result = await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        yield LoginSuccess(result);
      } catch (e) {
        yield LoginError(e.toString());
      }
    }
  }
}
