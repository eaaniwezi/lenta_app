import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lenta_app/blocs/auth/auth_bloc.dart';
import 'package:lenta_app/repositories/auth_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepository;
  final AuthBloc userAuthBloc;

  LoginBloc({
    required LoginState initialState,
    required this.authRepository,
    required this.userAuthBloc,
  })  : assert(authRepository != null),
        assert(userAuthBloc != null),
        super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

    if (event is SignInEvent) {
      try {
        yield UserLoginLoading();
        final token = await authRepository.loginUser(
            email: event.email, password: event.password); 
         userAuthBloc.add(UserIsLoggedIn(accessToken: token.accessToken!, refreshToken: token.refreshToken!));
        yield UserLoginInitial();
      } catch (e) {
        yield UserLoginFailure(error: e.toString());
      }
    }
  }
}
