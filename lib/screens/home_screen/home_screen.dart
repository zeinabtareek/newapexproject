import 'package:newapexproject/component/appbar_home_screen.dart';
import 'package:newapexproject/component/category_card.dart';
import 'package:newapexproject/component/circle_card.dart';
import 'package:newapexproject/component/offer_card.dart';
import 'package:newapexproject/component/smooth_indicator.dart';
import 'package:newapexproject/component/text_field_search.dart';
import 'package:newapexproject/constant.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBarHomeScreen(
        address: "Alex,Egypt",
      ),
      backgroundColor: K.whiteColor,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
            child: AutoSizeText(
              "What are you looking for",
              style: TextStyle(color: K.blackColor, fontSize: 18.sp),
            ),
          ),
          TextFieldSearch(),
          box(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Top Category",
                  style: TextStyle(color: K.blackColor, fontSize: 18.sp),
                ),
                AutoSizeText(
                  "show all",
                  style: TextStyle(color: K.mainColor, fontSize: 15.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150.h,
            child: ListView.builder(
                itemCount: _controller.images.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemBuilder: (ctx, index) => CircleCard(
                      onTap: () {},
                      images: _controller.images[index],
                      labels: _controller.labels[index],
                    )),
          ),
          CarouselSlider.builder(
              itemCount: _controller.orders.length,
              carouselController: _controller.controller,
              itemBuilder: (context, index, realIndex) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OfferCards(
                      onTap: () {},
                      images: _controller.orders[index],
                    ),
                  ),
              options: CarouselOptions(
                  height: 300.h,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    print(index);
                    _controller.currentIndex.value = index;
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _controller.orders.asMap().entries.map((entry) {
              return Obx(
                () => SmoothIndicator(
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : K.mainColor)
                        .withOpacity(
                            _controller.currentIndex == entry.key ? 0.9 : 0.2)),
              );
            }).toList(),
          ),
          box(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Recommend for you",
                  style: TextStyle(color: K.blackColor, fontSize: 18.sp),
                ),
                AutoSizeText(
                  "show all",
                  style: TextStyle(color: K.mainColor, fontSize: 15.sp),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.0.w,
              vertical: 8.0.h,
            ),
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 8,
                childAspectRatio: MediaQuery.of(context).size.width.w/.7 /
                    (MediaQuery.of(context).size.height / 1.6.h),
              ),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) => CategoryCard(
                image:  "assets/images/kit.jpg",
                label: "clothes",
                price: "250\$",
                onTap: (){},
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget box() => SizedBox(
      height: 40.h,
    );
