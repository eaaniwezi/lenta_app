// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables
import 'dart:async';
import 'package:flutter/material.dart';
import '../../const/theme.dart' as style;
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
  BitmapDescriptor? diffLog;
  final Completer<GoogleMapController> _mapController = Completer();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocationBloc>(context).add(GetCurrentLocation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is CurrentLocationSuccessState) {
            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  markers: state.allRestaurants.map((restaurantModel) {
                    getMarkers();
                    return Marker(
                      markerId: MarkerId(restaurantModel.id.toString()),
                      icon: diffLog == null
                          ? BitmapDescriptor.defaultMarker
                          : diffLog!,
                    );
                  }).toSet(),
                  onMapCreated: (GoogleMapController controller) {
                    _mapController.complete(controller);
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      state.currentLocation.latitude,
                      state.currentLocation.longitude,
                    ),
                    zoom: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
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

  // Future<void> _goToPlace(Place place) async {
  //   try {
  //     final GoogleMapController controller = await _mapController.future;
  //     controller.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(
  //             target: LatLng(
  //                 place.geometry.location.lat, place.geometry.location.lng),
  //             zoom: 14.0),
  //       ),
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<BitmapDescriptor> getMarkers() async {
    var result;
    try {
      result = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(5, 5)),
        "assets/map_locator.png",
      );
      setState(() {
        diffLog = result;
      });
      return result;
    } catch (e) {
      return result;
    }
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
