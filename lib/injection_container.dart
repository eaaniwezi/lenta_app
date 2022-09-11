import 'package:get_it/get_it.dart';
import 'package:lenta_app/blocs/auth/auth_bloc.dart';
import 'package:lenta_app/blocs/location/location_bloc.dart';
import 'package:lenta_app/blocs/login/login_bloc.dart';
import 'package:lenta_app/blocs/restaurant/restaurant_bloc.dart';
import 'package:lenta_app/repositories/auth_repo.dart';
import 'package:lenta_app/blocs/register/register_bloc.dart';
import 'package:lenta_app/repositories/geolocator_repo.dart';
import 'package:lenta_app/repositories/restaurant_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
 // Bloc
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(authRepo: sl<AuthRepo>(),initialState: sl<UserInitState>(), restaurantRepo: sl<RestaurantRepo>()));
  sl.registerLazySingleton<LoginBloc>(() => LoginBloc(authRepository: sl<AuthRepo>(),initialState: sl<UserLoginInitState>(), userAuthBloc: sl<AuthBloc>()));
  sl.registerLazySingleton<RegisterBloc>(() => RegisterBloc(authRepository: sl<AuthRepo>(),initialState: sl<RegisteringUserInitState>(), userAuthBloc: sl<AuthBloc>()));
  sl.registerLazySingleton<LocationBloc>(() => LocationBloc(geolocatorRepo: sl<GeolocatorRepo>(), initialState: sl<LocationInitial>(), restaurantRepo:sl<RestaurantRepo>()));
  sl.registerLazySingleton<RestaurantBloc>(() => RestaurantBloc(  initialState: sl<RestaurantInitial>(), restaurantRepo:sl<RestaurantRepo>()));

  // Use cases
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo());
  sl.registerLazySingleton<GeolocatorRepo>(() => GeolocatorRepo());
  sl.registerLazySingleton<RestaurantRepo>(() => RestaurantRepo());

  sl.registerLazySingleton<UserInitState>(() => UserInitState());
  sl.registerLazySingleton<RestaurantInitial>(() => RestaurantInitial());
  sl.registerLazySingleton<LocationInitial>(() => LocationInitial());
  sl.registerLazySingleton<UserLoginInitState>(() => UserLoginInitState());
  sl.registerLazySingleton<RegisteringUserInitState>(() => RegisteringUserInitState());

}
