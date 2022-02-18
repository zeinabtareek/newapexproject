
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/component/buttons_product_screen.dart';
import 'package:newapexproject/component/card_products_screen.dart';
import 'package:newapexproject/routes/app_route.dart';
import '../../constant.dart';
import '../../data.dart';
import 'controller/product_details_controller.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProductScreenController());
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(
              icon: Icon(
                EvaIcons.shoppingCartOutline,
                color: K.grayColor,
                size: 25.sp,
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.cartScreen);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
                vertical: 15.0.h,
              ),
              child: Text(
                'Products',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 60.h,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _controller.labels.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.0.w,
                      vertical: 8.0.h,
                    ),
                    child: Obx(
                      () => Buttons(
                        label: _controller.labels[index],
                        color: _controller.selectedIndex.value == index
                            ? K.whiteColor
                            : K.mainColor,
                        colorText: _controller.selectedIndex.value == index
                            ? K.mainColor
                            : K.whiteColor,
                        onTap: () {
                          _controller.selected(index);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.0.w,
                vertical: 8.0.h,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 0,
                  childAspectRatio: MediaQuery.of(context).size.width.w /
                      (MediaQuery.of(context).size.height / 1.6.h),
                ),
                itemCount: _controller.productsText.length,
                itemBuilder: (BuildContext context, int index) => Obx(
                  () => ProductCard(
                    favouriteFun: () {
                      _controller.checkFun();
                    },
                    images: productsImage[index],
                    iconData: _controller.check.value
                        ? Icons.favorite
                        : Icons.favorite_border,
                    label: _controller.productsText[index],
                    onTap: () {
                      Get.toNamed(AppRoutes.productDetailsScreen);
                    },
                    price: ' \$52.00',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
