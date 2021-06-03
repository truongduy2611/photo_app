part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginSuccess extends LoginState {
  const LoginSuccess(this.userCredential);

  final UserCredential userCredential;

  @override
  List<Object> get props => [userCredential];
}

class LoginError extends LoginState {
  LoginError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
