import 'package:auto_route/auto_route.dart';
import 'package:lenta_app/main_page.dart';
import 'package:lenta_app/screens/map_screen.dart';
import 'package:lenta_app/screens/home_screen.dart';
import 'package:lenta_app/screens/profile_screen.dart';
import 'package:lenta_app/screens/sign_in_screen.dart';
import 'package:lenta_app/screens/sign_up_screen.dart';
import 'package:lenta_app/screens/welcome_screen.dart';
import 'package:lenta_app/screens/favourite_screen.dart';
import 'package:lenta_app/screens/restaurant_detail_screen.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(page: WelcomeScreen, initial: true),
  AutoRoute(page: SignInScreen, path: '/sign-in'),
  AutoRoute(page: SignUpScreen, path: '/sign-up'),
  AutoRoute(page: MapScreen, path: '/map'),
  AutoRoute(page: HomeScreen, path: '/home'),
  AutoRoute(page: MainPage, path: '/main-page'),
  AutoRoute(page: ProfileScreen, path: '/profile'),
  AutoRoute(page: FavouriteScreen, path: '/favourite'),
  AutoRoute(page: RestaurantDetailScreen, path: '/restaurant-detail' ),
])
class $AppRouter {}
