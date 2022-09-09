import 'package:get_it/get_it.dart';
import 'package:lenta_app/blocs/auth/auth_bloc.dart';
import 'package:lenta_app/blocs/login/login_bloc.dart';
import 'package:lenta_app/repositories/auth_repo.dart';
import 'package:lenta_app/blocs/register/register_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
 // Bloc
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(authRepository: sl<AuthRepo>(),initialState: sl<UserInitState>()));
  sl.registerLazySingleton<LoginBloc>(() => LoginBloc(authRepository: sl<AuthRepo>(),initialState: sl<UserLoginInitState>(), userAuthBloc: sl<AuthBloc>()));
  sl.registerLazySingleton<RegisterBloc>(() => RegisterBloc(authRepository: sl<AuthRepo>(),initialState: sl<RegisteringUserInitState>(), userAuthBloc: sl<AuthBloc>()));

  // Use cases
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo());
  sl.registerLazySingleton<UserInitState>(() => UserInitState());
  sl.registerLazySingleton<UserLoginInitState>(() => UserLoginInitState());
  sl.registerLazySingleton<RegisteringUserInitState>(() => RegisteringUserInitState());

}
