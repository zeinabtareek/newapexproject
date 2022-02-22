import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:newapexproject/screens/product_screen/controller/product_details_controller.dart';

import 'card_product.dart';

class CustomGridView extends StatelessWidget {
  final String ?image;
  final double ?price;
  final double ?discount;
  final String ?text;
  CustomGridView({ Key? key, required this.columnRatio,  this.image,  this.price, this.discount,  this.text, required this.width, }) : super();

  final int columnRatio;
  final double width;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProductScreenController());

    Random random = new Random();

    return StaggeredGridView.countBuilder(
      primary: false,
      crossAxisCount: 12,
      itemBuilder: (context, index) =>
        ProductCard(price: 200.0, text: 'Adidas Originals Relaxed Risque Lightweight', image: 'assets/images/Image37.png',discount:300,  width: 100.w,),
      staggeredTileBuilder: (index) => StaggeredTile.fit(columnRatio),
    );
  }
}