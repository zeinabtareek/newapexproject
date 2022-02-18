
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/add_button.dart';
import 'package:newapexproject/component/container_colors.dart';
import 'package:newapexproject/component/indicator.dart';

import '../../constant.dart';
import 'controller/product_details_controller.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsController());
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: K.width.w,
            height: MediaQuery.of(context).size.height/1.5,
            // height: K.height / 3.h,
            child: Stack(
              children: [
                PageView.builder(
                  controller: controller.boardController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                    ),
                    child: Image.network(
                      controller.labels[index],
                      height: double.infinity,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  itemCount: controller.labels.length,
                  onPageChanged: (int index) {
                    controller.isFirstFunction(index);
                    controller.isLastFunction(index);
                  },
                ),
                Indicator(
                  pageController: controller.boardController,
                  count: controller.labels.length,
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0.w ,vertical: 5.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         Wrap(
                           direction: Axis.vertical,
                           spacing: .5,
                           children: [
                             Text(
                              'Classic Hoodie',
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: K.blackColor,
                                fontFamily: "Poppins-Bold",
                              ),
                        ),Text(
                               'Boomboogie',
                               style: TextStyle(
                                 color: K.grayColor,
                                 fontSize: 5.sp,
                                 height: .99.h
                               ),
                             ),
                           ],
                         ),SizedBox(width: 4.w,),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(' 4.7', style: TextStyle(color: Colors.black.withOpacity(.6))),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.share,
                          color: K.grayColor,
                        ),
                        Obx(() => IconButton(
                            onPressed: () {
                              controller.checkFun();
                            },
                            icon: controller.check.value
                                ? const Icon(
                                    Icons.favorite,
                                    color: K.mainColor,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    color: K.grayColor,
                                  )))
                      ],
                    ),
                  ],
                ),
                K.sizedBoxH,
                Text(
                  'Description\n',
                  style: TextStyle(
                      color: Colors.black.withOpacity(.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 6.sp),
                ),
                 Text(
                  'The Under Armour Mens Rival Cotton Sweatshirt delivers comfortable, casual winter comfort. Constructed from mid-weight performance cotton a brushed fleece interior it delivers a warm and cosy fit that  sure to keep your body temps ',
                  // maxLines: 4,
                  style: TextStyle(
                    fontSize: 5.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                K.sizedBoxH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'Colors',
                          style: TextStyle(
                            fontSize: 6.sp,
                            color: Colors.grey,
                            fontFamily: "Poppins-Bold",
                          ),
                        ),
                        Row(children: [
                          SizedBox(
                            height: 25,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (ctx, index) => ContainerColors(
                                      color: K.colorList[index],
                                    )),
                          ),
                        ])
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 6.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins SemiBold",
                          ),
                        ),
                        Text(
                          '\$75.00 ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                K.sizedBoxH,
              ],
            ),
          ),
          K.sizedBoxH,

          AddButton(
            text: 'Add to cart',
            onPressed: () {},
          ),
          K.sizedBoxH,
          K.sizedBoxH
        ],
      ),
    ));
  }
}
