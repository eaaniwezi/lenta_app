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
  final List<Restaurant> allRestaurants;
  final List<Restaurant> favRestaurants;
  const UserAuthenticated({
    required this.userModel,
    required this.allRestaurants,
    required this.favRestaurants,
  });
}

class UserUnauthenticated extends AuthState {}

class UserLoading extends AuthState {}
