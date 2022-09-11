part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class InitializingUser extends AuthState {}

class UserInitState extends AuthState {}

class UserUninitialized extends AuthState {}

class LoadingUserProfile extends AuthState {}

class UserAuthenticated extends AuthState {
  final User userModel;
 
  const UserAuthenticated({
    required this.userModel,
    
  });
}

class UserUnauthenticated extends AuthState {}

class UserLoading extends AuthState {}
