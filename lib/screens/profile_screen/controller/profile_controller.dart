import 'package:flutter/material.dart';
import 'package:newapexproject/controller/base_controller.dart';

class ProfileController extends BaseController {
  final List<String> labels = [
    'My Orders',
    'Payment Methods',
    'Shipping Addresses',
    'My Wishlist',
    'Change Password',
    'Log Out'
  ];
  final List<String> subTitle = [
    'Already have 12 order',
    'visa **43',
    '3 addresses','','',''
  ];
    final List<IconData> icons=[
      Icons.shopping_bag_outlined,
      Icons.payment,
      Icons.share_location_outlined,
      Icons.favorite_border_outlined,
      Icons.lock_outline,
      Icons.logout
    ];
}
