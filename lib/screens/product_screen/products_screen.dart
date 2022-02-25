import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/component/buttons_product_screen.dart';
import 'package:newapexproject/component/card_product.dart';
import 'package:newapexproject/component/responsive_grid.dart';
import 'package:newapexproject/routes/app_route.dart';
import '../../constant.dart';
import 'controller/product_details_controller.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProductScreenController());
    return Scaffold(
      appBar: CustomAppBar(
        label: 'Products',
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
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.5.h),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (ctx, index) => ProductCard(
                  price: 200.0,
                  text: 'Adidas Originals Relaxed Risque Lightweight',
                  image: 'assets/images/Image37.png',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
