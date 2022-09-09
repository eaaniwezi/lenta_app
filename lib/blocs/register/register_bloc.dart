import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lenta_app/blocs/auth/auth_bloc.dart';
import 'package:lenta_app/repositories/auth_repo.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthRepo authRepository;
  AuthBloc userAuthBloc;

  RegisterBloc({
    required RegisterState initialState,
    required this.authRepository,
    required this.userAuthBloc,
  })  : assert(authRepository != null),
        super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is SignUpEvent) {
      try {
        yield RegisteringUserLoading();
        final token = await authRepository.registerUser(
            email: event.email,
            phone: event.phone,
            password: event.password,
            nickname: event.nickname);
        userAuthBloc.add(UserIsLoggedIn(accessToken: token.accessToken!, refreshToken: token.refreshToken!));
        yield RegisteringUserInitial();
      } catch (e) {
        yield RegisteringUserFailure(error: e.toString());
      }
    }
  }
}
