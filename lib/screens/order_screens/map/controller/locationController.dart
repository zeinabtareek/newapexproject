// import 'dart:collection';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:get/get.dart';
// import 'package:newapexproject/controller/base_controller.dart';
// import 'package:newapexproject/enum/view_state.dart';
// import 'package:newapexproject/screens/order_screens/map/services/location_services.dart';
//
// class GeoLocatorController extends BaseController {
//   GeoLocatorServices geoLocatorServices=GeoLocatorServices();
//
//   Position ?CurrentLocation ;
//
//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     setSate(ViewState.busy);
//     await setCurrentLocation();
//     setSate(ViewState.idle);
//   }
// setCurrentLocation()async{
//   CurrentLocation=await geoLocatorServices.getCurrentLocation();
//   update();
// }
//
//
//
// }
