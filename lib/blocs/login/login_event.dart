part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends LoginEvent {}

class SignInEvent extends LoginEvent {
  final String email;
  final String password;
  const SignInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
