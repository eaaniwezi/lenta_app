// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lenta_app/models/restaurant.dart';
import 'package:lenta_app/models/user.dart';
import 'package:lenta_app/repositories/auth_repo.dart';
import 'package:lenta_app/repositories/restaurant_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  final RestaurantRepo restaurantRepo;

  AuthBloc({
    required this.authRepo,
    required this.restaurantRepo,
    required AuthState initialState,
  })  : assert(authRepo != null),
        super(initialState) {
    add(AppStarted(queryRestuarant: ''));
  }
  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      try {
        yield InitializingUser();
        final bool hasToken = await authRepo.hasToken();
        if (hasToken) {
          late final User _userModel;
          late final List<Restaurant> _restaurantList;
          late final List<Restaurant> _favRestaurantList;
          _userModel = await authRepo.getUser();
          _restaurantList = await restaurantRepo.getAllRestaurants(
              query: event.queryRestuarant);
          _favRestaurantList = await restaurantRepo.getFavRestaurants();
          yield UserAuthenticated(
              userModel: _userModel,
              allRestaurants: _restaurantList,
              favRestaurants: _favRestaurantList);
        } else {
          yield UserUnauthenticated();
        }
      } catch (e) {
        yield UserUnauthenticated();
      }
    }
    if (event is LogOutEvent) {
      yield UserLoading();
      await authRepo.deleteToken();
      yield UserUnauthenticated();
    }
    if (event is UserIsLoggedIn) {
      yield UserLoading();
      await authRepo.persistTokens(
          accessToken: event.accessToken, refreshToken: event.refreshToken);

      try {
        late final User _userModel;
        late final List<Restaurant> _restaurantList;
        late final List<Restaurant> _favRestaurantList;
        _userModel = await authRepo.getUser();
        _restaurantList =
            await restaurantRepo.getAllRestaurants(query: "");
        _favRestaurantList = await restaurantRepo.getFavRestaurants();
        yield UserAuthenticated(
            userModel: _userModel,
            allRestaurants: _restaurantList,
            favRestaurants: _favRestaurantList);
      } catch (e) {
        yield UserUnauthenticated();
      }
    }
  }
}
