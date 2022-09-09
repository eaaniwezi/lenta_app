part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisteringUserInitState extends RegisterState {}

class RegisteringUserInitial extends RegisterState {}

class RegisteringUserLoading extends RegisterState {}

class RegisteringUserFailure extends RegisterState {
  final String error;

  const RegisteringUserFailure({required this.error});
}
