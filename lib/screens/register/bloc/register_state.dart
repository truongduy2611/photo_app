part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterInProgress extends RegisterState {}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess(this.userCredential);

  final UserCredential userCredential;

  @override
  List<Object> get props => [userCredential];
}

class RegisterError extends RegisterState {
  RegisterError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
