// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../../main_page.dart' as _i6;
import '../../models/restaurant.dart' as _i12;
import '../favourite_screen.dart' as _i8;
import '../home_screen.dart' as _i5;
import '../map_screen.dart' as _i4;
import '../profile_screen.dart' as _i7;
import '../restaurant_detail_screen.dart' as _i9;
import '../sign_in_screen.dart' as _i2;
import '../sign_up_screen.dart' as _i3;
import '../welcome_screen.dart' as _i1;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    WelcomeScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.WelcomeScreen());
    },
    SignInScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInScreen());
    },
    SignUpScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignUpScreen());
    },
    MapScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.MapScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomeScreen());
    },
    MainPageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.MainPage());
    },
    ProfileScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ProfileScreen());
    },
    FavouriteScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.FavouriteScreen());
    },
    RestaurantDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantDetailScreenRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.RestaurantDetailScreen(
              key: args.key, restaurantModel: args.restaurantModel));
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(WelcomeScreenRoute.name, path: '/'),
        _i10.RouteConfig(SignInScreenRoute.name, path: '/sign-in'),
        _i10.RouteConfig(SignUpScreenRoute.name, path: '/sign-up'),
        _i10.RouteConfig(MapScreenRoute.name, path: '/map'),
        _i10.RouteConfig(HomeScreenRoute.name, path: '/home'),
        _i10.RouteConfig(MainPageRoute.name, path: '/main-page'),
        _i10.RouteConfig(ProfileScreenRoute.name, path: '/profile'),
        _i10.RouteConfig(FavouriteScreenRoute.name, path: '/favourite'),
        _i10.RouteConfig(RestaurantDetailScreenRoute.name,
            path: '/restaurant-detail')
      ];
}

/// generated route for
/// [_i1.WelcomeScreen]
class WelcomeScreenRoute extends _i10.PageRouteInfo<void> {
  const WelcomeScreenRoute() : super(WelcomeScreenRoute.name, path: '/');

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [_i2.SignInScreen]
class SignInScreenRoute extends _i10.PageRouteInfo<void> {
  const SignInScreenRoute() : super(SignInScreenRoute.name, path: '/sign-in');

  static const String name = 'SignInScreenRoute';
}

/// generated route for
/// [_i3.SignUpScreen]
class SignUpScreenRoute extends _i10.PageRouteInfo<void> {
  const SignUpScreenRoute() : super(SignUpScreenRoute.name, path: '/sign-up');

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i4.MapScreen]
class MapScreenRoute extends _i10.PageRouteInfo<void> {
  const MapScreenRoute() : super(MapScreenRoute.name, path: '/map');

  static const String name = 'MapScreenRoute';
}

/// generated route for
/// [_i5.HomeScreen]
class HomeScreenRoute extends _i10.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i6.MainPage]
class MainPageRoute extends _i10.PageRouteInfo<void> {
  const MainPageRoute() : super(MainPageRoute.name, path: '/main-page');

  static const String name = 'MainPageRoute';
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileScreenRoute extends _i10.PageRouteInfo<void> {
  const ProfileScreenRoute() : super(ProfileScreenRoute.name, path: '/profile');

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i8.FavouriteScreen]
class FavouriteScreenRoute extends _i10.PageRouteInfo<void> {
  const FavouriteScreenRoute()
      : super(FavouriteScreenRoute.name, path: '/favourite');

  static const String name = 'FavouriteScreenRoute';
}

/// generated route for
/// [_i9.RestaurantDetailScreen]
class RestaurantDetailScreenRoute
    extends _i10.PageRouteInfo<RestaurantDetailScreenRouteArgs> {
  RestaurantDetailScreenRoute(
      {_i11.Key? key, required _i12.Restaurant restaurantModel})
      : super(RestaurantDetailScreenRoute.name,
            path: '/restaurant-detail',
            args: RestaurantDetailScreenRouteArgs(
                key: key, restaurantModel: restaurantModel));

  static const String name = 'RestaurantDetailScreenRoute';
}

class RestaurantDetailScreenRouteArgs {
  const RestaurantDetailScreenRouteArgs(
      {this.key, required this.restaurantModel});

  final _i11.Key? key;

  final _i12.Restaurant restaurantModel;

  @override
  String toString() {
    return 'RestaurantDetailScreenRouteArgs{key: $key, restaurantModel: $restaurantModel}';
  }
}
