import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());
  final _auth = FirebaseAuth.instance;

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is OnPressedRegisterButtonEvent) {
      yield RegisterInProgress();
      try {
        final result = await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        yield RegisterSuccess(result);
      } catch (e) {
        yield RegisterError(e.toString());
      }
    }
  }
}
