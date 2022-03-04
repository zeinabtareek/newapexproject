import 'dart:collection';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/enum/view_state.dart';
import 'package:newapexproject/screens/order_screens/map/services/location_services.dart';

class MapController extends BaseController {
  // LocationService locationService=LocationService();
   Position? CurrentLocation ;
  // LocationData? locationData ;

  var _marker = HashSet<Marker>().obs;
  HashSet<Marker> get marker => _marker.value;

  markLocation() {
    marker.add(Marker(
      markerId: MarkerId("1"),
      position: LatLng(CurrentLocation!.latitude, CurrentLocation!.longitude),
      infoWindow: InfoWindow(
        title: 'locate you address',
        snippet: 'Please be aware to define your address clearly ',
      ),onTap: (){}


    ));
    _marker.value = marker;
  }

  @override
  void onInit()async {
    super.onInit();
    setSate(ViewState.idle);
    // await setCurrentLocation();

    // setSate(ViewState.busy);
    markLocation();

    setSate(ViewState.idle);
  }




}
