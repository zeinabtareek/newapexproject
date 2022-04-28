import 'dart:collection';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/enum/view_state.dart';

class MyLocationController extends BaseController {
  var _marker = HashSet<Marker>().obs;
  Position? _position;

  HashSet<Marker> get marker => _marker.value;

  Position? get position => _position;

  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    await determinePosition();
    await markLocation();
    setSate(ViewState.idle);
  }

  markLocation() {
    marker.add(Marker(
      markerId: MarkerId("1"),
      position: LatLng(position!.latitude, position!.longitude),
    ));
    _marker.value = marker;
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    return _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high

    );
  }
}

// import 'dart:collection';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:get/get.dart';
// import 'package:newapexproject/controller/base_controller.dart';
// import 'package:newapexproject/enum/view_state.dart';
//
// class MapController extends BaseController {
//   var _marker = HashSet<Marker>().obs;
//   Position? position;
//
//   HashSet<Marker> get marker => _marker.value;
//   final Address = ''.obs;
//   final location = ''.obs;
//
//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     setSate(ViewState.busy);
//     // await markLocation();
//     await getGeoLocationPosition();
//     setSate(ViewState.idle);
//   }
//
//   markLocation() {
//     marker.add(Marker(
//       markerId: MarkerId("1"),
//       position: LatLng(30.6296975, 31.0794947),
//     ));
//     _marker.value = marker;
//   }
//
//   Future<Position> getGeoLocationPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       await Geolocator.openLocationSettings();
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     print(position);
//     return position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }
//
//   Future<void> GetAddressFromLatLong(Position position) async {
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     print(placemarks);
//     Placemark place = placemarks[0];
//     Address.value =
//         '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
//   }
// }
