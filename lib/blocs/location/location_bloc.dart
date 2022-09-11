import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lenta_app/models/restaurant.dart';
import 'package:lenta_app/repositories/restaurant_repo.dart';

import '../../repositories/geolocator_repo.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GeolocatorRepo geolocatorRepo;
  final RestaurantRepo restaurantRepo;
  LocationBloc({
    required this.geolocatorRepo,
    required this.restaurantRepo,
    required LocationState initialState,
  })  : assert(geolocatorRepo != null),
        super(initialState) {
    add(InitialEvent());
  }
  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is GetCurrentLocation) {
      try {
        yield CurrentLocationFetchingState();
        late final Position? _currentLocation;
          late final List<Restaurant> _restaurantList;
        _currentLocation = await geolocatorRepo.getCurrentLocation(); _restaurantList = await restaurantRepo.getAllRestaurants(
              query: "");
        yield CurrentLocationSuccessState(currentLocation: _currentLocation, allRestaurants: _restaurantList);
      } catch (e) {
        yield CurrentLocationErrorState();
      }
    }
  }
}
