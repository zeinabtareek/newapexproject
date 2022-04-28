import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/component/circle_progress_indicator.dart';
import 'package:newapexproject/constant.dart';
import 'package:newapexproject/enum/view_state.dart';
import 'package:newapexproject/routes/app_route.dart';
import 'package:newapexproject/screens/order_screens/map/controller/locationController.dart';
import 'package:newapexproject/screens/order_screens/map/controller/map_controller.dart';

class MyLocationScreen extends StatelessWidget {
  final _controller = Get.put(MapController());
  late final LatLng? currentLocation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        label: 'search location ',
      ),
      body: Stack(
        children: [
          Obx(
            () => (_controller.state == ViewState.busy)
                ? Indicator()
                : GoogleMap(
                    zoomControlsEnabled: false,
                    //Map widget from google_maps_flutter package
                    zoomGesturesEnabled: true,
                    //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition(
                      //innital position in map
                      target: LatLng(_controller.position!.latitude,
                          _controller.position!.longitude),
                      //initial position
                      zoom: 14.0, //initial zoom level
                    ),
                    mapType: MapType.normal,
                    //map type
                    onMapCreated: (controller) {
                      //method called when map is created
                      _controller.controller.complete();
                      // _x.markLocation();
                    },
                    markers: _controller.marker,
                  ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.all(11.w),
              color: K.whiteColor,
              child: TextField(
                decoration: InputDecoration(hintText: '   search location...'),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 20,
      //   alignment: Alignment.center,
      //   child: Text(
      //       'lat :${_controller.CurrentLocation!.latitude} ,long:${_controller.CurrentLocation!.longitude}'),
      // ),
    ));
  }
}
