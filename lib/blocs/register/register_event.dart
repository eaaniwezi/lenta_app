part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends RegisterEvent {}

class SignUpEvent extends RegisterEvent {
  final String email;
  final String password;
  final String phone;
  final String nickname;
  const SignUpEvent({
    required this.email,
    required this.password,
    required this.phone,
    required this.nickname,
  });
}


