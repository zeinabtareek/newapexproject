import 'dart:async';
import 'dart:collection';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newapexproject/enum/view_state.dart';

class MapController extends GetxController {
  final _state = ViewState.idle.obs;
  final address = "".obs;

  ViewState get state => _state.value;

  setSate(ViewState state) {
    _state.value = state;
  }

  final markers = Set<Marker>().obs;

  var _marker = HashSet<Marker>().obs;

  HashSet<Marker> get marker => _marker.value;

   Position? position;

  Completer<GoogleMapController> controller = Completer();

  markLocation() {
    marker.add(Marker(
        draggable: true,
        markerId: MarkerId("1"),
        position: LatLng(position!.latitude, position!.longitude),
        onDragEnd: ((newPosition) {
          print(newPosition.latitude);
          print(newPosition.longitude);
        })));
    _marker.value = marker;
  }

  MarkerId markerId = MarkerId("YOUR-MARKER-ID");

  mark() {
    markers.add(
      Marker(
        markerId: markerId,
        position: LatLng(position!.latitude, position!.longitude),
      ),
    );
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    setSate(ViewState.busy);
    await _determinePosition();
    print(position);
    // mark();
    setSate(ViewState.idle);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

// import 'dart:async';
// import 'dart:collection';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:newapexproject/controller/base_controller.dart';
// import 'package:newapexproject/enum/view_state.dart';
// import 'package:newapexproject/screens/order_screens/map/services/location_services.dart';
//
// class MapController extends BaseController {
//   // LocationService locationService=LocationService();
//   Position? CurrentLocation;
//
//   Completer<GoogleMapController> controller = Completer();
//
//   // LocationData? locationData ;
//
//   var _marker = HashSet<Marker>().obs;
//
//   HashSet<Marker> get marker => _marker.value;
//
//   markLocation() {
//     marker.add(Marker(
//         markerId: MarkerId("1"),
//         position: LatLng(CurrentLocation!.latitude, CurrentLocation!.longitude),
//         infoWindow: InfoWindow(
//           title: 'locate you address',
//           snippet: 'Please be aware to define your address clearly ',
//         ),
//         onTap: () {}));
//     _marker.value = marker;
//   }
//
//   @override
//   void onInit() async {
//     super.onInit();
//     setSate(ViewState.idle);
//     // await setCurrentLocation();
//     controller;
//     // setSate(ViewState.busy);
//     markLocation();
//
//     setSate(ViewState.idle);
//   }
// }
