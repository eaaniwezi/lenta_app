// ignore_for_file: unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lenta_app/models/user.dart';
import 'package:lenta_app/repositories/auth_repo.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepository;

  AuthBloc({required this.authRepository, required AuthState initialState})
      : assert(authRepository != null),
        super(initialState) {
    add(AppStarted());
  }
  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      try {
        yield InitializingUser();
        final bool hasToken = await authRepository.hasToken();
        if (hasToken) {
          late final User _userModel;
          _userModel = await authRepository.getUser();
          yield UserAuthenticated(userModel: _userModel);
        } else {
          yield UserUnauthenticated();
        }
      } catch (e) {
        yield UserUnauthenticated();
      }
    }
    if (event is LogOutEvent) {
      yield UserLoading();
      await authRepository.deleteToken();
      yield UserUnauthenticated();
    }
    if (event is UserIsLoggedIn) {
      yield UserLoading();
      await authRepository.persistTokens(accessToken: event.accessToken, refreshToken: event.refreshToken);

      try {
        late final User _userModel;
        _userModel = await authRepository.getUser();

        yield UserAuthenticated(userModel: _userModel);
      } catch (e) {
        yield UserUnauthenticated();
      }
    }
  }
}
