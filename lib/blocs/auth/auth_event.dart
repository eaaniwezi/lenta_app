// ignore_for_file: must_be_immutable

part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {
  final String queryRestuarant;
  const AppStarted({
    required this.queryRestuarant,
  });
}

class UserIsLoggedIn extends AuthEvent {
  final String accessToken;
  final String refreshToken;

  const UserIsLoggedIn({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object> get props => [accessToken, refreshToken];
}

class LogOutEvent extends AuthEvent {}
