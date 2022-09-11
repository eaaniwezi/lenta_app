// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_collection_literals, prefer_final_fields
import 'dart:async';
import 'package:flutter/material.dart';
import '../../const/theme.dart' as style;
import 'package:flutter_svg/flutter_svg.dart';
import '../blocs/location/location_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenta_app/widgets/search_bar_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor? restaurantIcon;
  BitmapDescriptor? currentLocationIcon;
  Set<Marker> _markers = Set<Marker>();
  LatLng? currentLocation;
  LatLng? restaurantLocations;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocationBloc>(context).add(GetCurrentLocation());
    getCurrentLocation();
    setCustomIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is CurrentLocationSuccessState) {
            return InkWell(
              onTap: () {
                animateCamera();
              },
              child: SvgPicture.asset("assets/map_extra.svg"),
            );
          }
          return Text("");
        },
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is CurrentLocationSuccessState) {
            return Stack(
              children: [
                GoogleMap(
                  myLocationEnabled: false,
                  compassEnabled: false,
                  tiltGesturesEnabled: false,
                  zoomControlsEnabled: false,
                  markers: _markers,
                  initialCameraPosition: CameraPosition(
                    zoom: 16,
                    target: LatLng(state.currentLocation.latitude,
                        state.currentLocation.longitude),
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.isCompleted == false
                        ? _controller.complete(controller)
                        : null;
                    getMarkers();
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.06),
                  child: SearchBarWidget(isMapScreen: true),
                ),
              ],
            );
          }
          if (state is CurrentLocationErrorState) {
            return _errorWidget();
          }
          return Center(
              child:
                  CircularProgressIndicator(color: style.Colors.purpleColor));
        },
      ),
    );
  }

  void getCurrentLocation() async {
    final _locationBloc = BlocProvider.of<LocationBloc>(context);
    var position = await _locationBloc.geolocatorRepo.getCurrentLocation();
    currentLocation = LatLng(position.latitude, position.longitude);
  }

  void setCustomIcons() async {
    restaurantIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.0),
      "assets/map_locator.png",
    );

    currentLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.0),
      "assets/currentLocationIcon.png",
    );
  }

  void animateCamera() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        zoom: 16,
        target:
            LatLng(currentLocation!.latitude, currentLocation!.longitude))));
  }

  void getMarkers() async {
    final _locationBloc = BlocProvider.of<LocationBloc>(context);
    var restaurantList =
        await _locationBloc.restaurantRepo.getAllRestaurants(query: "");
    var resMarker = restaurantList.map((restaurant) {
      return Marker(
        markerId: MarkerId(restaurant.title.toString()),
        position:
            LatLng(restaurant.coords!.latitude!, restaurant.coords!.longitude!),
        icon: restaurantIcon == null
            ? BitmapDescriptor.defaultMarker
            : restaurantIcon!,
      );
    }).toSet();
    setState(() {
      _markers = resMarker;
      _markers.add(Marker(
        markerId: MarkerId("Current location"),
        position: currentLocation == null ? LatLng(0, 0) : currentLocation!,
        icon: currentLocationIcon == null
            ? BitmapDescriptor.defaultMarker
            : currentLocationIcon!,
      ));
    });
  }

  _errorWidget() {
    return Center(
      child: Text(
        "Error loading Map data...",
        textAlign: TextAlign.center,
        style: GoogleFonts.manrope(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: style.Colors.redColor,
        ),
      ),
    );
  }
}
