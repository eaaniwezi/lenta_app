// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:bloc/bloc.dart';
import '../../models/restaurant.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/restaurant_repo.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepo restaurantRepo;
  RestaurantBloc({
    required this.restaurantRepo,
    required RestaurantState initialState,
  })  : assert(restaurantRepo != null),
        super(initialState) {
    add(FetchRestaurantEvent(queryRestuarant: ""));
  }
  @override
  Stream<RestaurantState> mapEventToState(RestaurantEvent event) async* {
    if (event is FetchRestaurantEvent) {
      try {
        yield FetchingRestaurantState();
        late final List<Restaurant> _restaurantList;
        late final List<Restaurant> _favRestaurantList;
        _restaurantList = await restaurantRepo.getAllRestaurants(
            query: event.queryRestuarant);
        _favRestaurantList = await restaurantRepo.getFavRestaurants();
        yield SuccessFetchingRestaurantState(
          allRestaurants: _restaurantList,
          favRestaurants: _favRestaurantList,
        );
      } catch (e) {
        yield ErrorFetchingRestaurantState();
      }
    }
   else if (event is AddToFavListEvent) {
      try {
        yield RestaurantInitial();
        await restaurantRepo.addToFavList(resturantId: event.resturantId);
        late final List<Restaurant> _restaurantList;
        late final List<Restaurant> _favRestaurantList;
        _restaurantList = await restaurantRepo.getAllRestaurants(query: "");
        _favRestaurantList = await restaurantRepo.getFavRestaurants();
        yield SuccessFetchingRestaurantState(
          allRestaurants: _restaurantList,
          favRestaurants: _favRestaurantList,
        );
        } catch (e) {
        add(FetchRestaurantEvent(queryRestuarant: ""));
      }
    } else if (event is RemoveFromFavListEvent) {
      try {
        yield RestaurantInitial();
        await restaurantRepo.removeFromFavList(resturantId: event.resturantId);
         late final List<Restaurant> _restaurantList;
        late final List<Restaurant> _favRestaurantList;
        _restaurantList = await restaurantRepo.getAllRestaurants(query: "");
        _favRestaurantList = await restaurantRepo.getFavRestaurants();
        yield SuccessFetchingRestaurantState(
          allRestaurants: _restaurantList,
          favRestaurants: _favRestaurantList,
        );
      } catch (e) {
        add(FetchRestaurantEvent(queryRestuarant: ""));
      }
    }
  }

}
