import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/component/appbar_home_screen.dart';
import 'package:newapexproject/component/brand_slider.dart';
import 'package:newapexproject/component/card_product.dart';
import 'package:newapexproject/component/category_card.dart';
import 'package:newapexproject/component/circle_card.dart';
import 'package:newapexproject/component/expanded_home_pic.dart';
import 'package:newapexproject/component/middle_home_slider.dart';
import 'package:newapexproject/component/offer_card.dart';
import 'package:newapexproject/component/row_text_home.dart';
import 'package:newapexproject/component/smooth_indicator.dart';
import 'package:newapexproject/component/text_field_search.dart';
import 'package:newapexproject/component/ticket.dart';
import 'package:newapexproject/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(HomeScreenController());
    final radius = MediaQuery.of(context).size.shortestSide * .7;
    final borderWidth = radius / 12;
    return Scaffold(
      appBar: AppBarHomeScreen(
        address: "Alex,Egypt",
      ),
      backgroundColor: K.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
              child: AutoSizeText("What are you looking for", style: TextStyle(color: K.blackColor, fontSize: 18.sp),),),
            TextFieldSearch(),
            box(),
            RowTextHomePage(Text: 'Top Category', isThereMore: true ,),
            SizedBox(
              height: 130.h,
              child: ListView.builder(
                  itemCount: _controller.images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (ctx, index) => CircleCard(
                        onTap: () {},
                        images: _controller.images[index],
                        labels: _controller.labels[index],
                      ),
               ),
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
                    height: 260.h,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      print(index);
                      _controller.currentIndex.value = index;
                    },),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _controller.orders.asMap().entries.map((entry) {
                return Obx(
                  () => SmoothIndicator(
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : K.mainColor)
                          .withOpacity(_controller.currentIndex == entry.key
                              ? 0.9
                              : 0.2),
                  ),
                );
              }).toList(),
            ),
            ExpandedHomePicture(image: expandedHomePicture[1].toString(),),
            K.sizedBoxH,
            RowTextHomePage(
              Text: 'Our Valuable Product',isThereMore: true,),
            K.sizedBoxH,
            Divider(),
            SizedBox(
              height: 180.h,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return BrandSlider(
                    text: 'NIKE',
                    image:
                        'https://marcqa.com/wp-content/uploads/2022/01/ZX_1K_Boost_Shoes_White_S42589_01_standard.jpg',
                  );
                },
              ),
            ),
            RowTextHomePage(
              Text: 'Recommended for you',isThereMore: true,
            ),

            Divider(),
            AspectRatio(
              aspectRatio: (100 / 50),
              child: MiddleHomePageSlider(borderWidth: borderWidth),
            ),
            Divider(),
            box(),
            ExpandedHomePicture(image: expandedHomePicture[0].toString(),),
            RowTextHomePage(Text: 'Our Popular Brands',isThereMore: false,),
            Divider(),
            box(),
            Row(
              children: [
                ...List.generate(
                  3, (index) => Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.0.w, vertical: 3.0.h),
                      child: Image.asset(
                        popularBrand[index].toString(),
                      ),
                    ),
                  ),
                )
              ],
            ), K.sizedBoxH,
            RowTextHomePage(
              Text: 'Best Rated Products',isThereMore: true,
            ),
            K.sizedBoxH,
            Divider(),
            Row(children: [
              ProductCard(price: 200.0, text: 'Adidas Originals Relaxed Risque Lightweight', image: 'assets/images/Image37.png', width: 100.w,),
              ProductCard(price: 200.0, text: 'Adidas Originals Relaxed Risque Lightweight', image: 'assets/images/Image37.png', width: 100.w,),
            ]),
            K.sizedBoxH,
          ],
        ),
      ),
    );
  }
}
Widget box() => SizedBox(
      height: 30.h,
    );
