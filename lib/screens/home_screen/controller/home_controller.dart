import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:newapexproject/controller/base_controller.dart';

class HomeScreenController extends BaseController {
  final CarouselController controller = CarouselController();
  final currentIndex = 0.obs;
  final List<String> images = [
    "assets/images/fashion.jpeg",
    "assets/images/beauty.jpeg",
    "assets/images/furniture.jpeg",
    "assets/images/device.jpeg",
    "assets/images/wire.jpeg"
  ];
  final List<String> labels = [
    'Fashion',
    'Beauty',
    'Furniture',
    'Device',
    'Accessories'
  ];
  final List<String> orders=[
    "assets/images/order.jpeg",
    "assets/images/offer.jpeg",
    "assets/images/offer2.jpeg",
  ];
}
