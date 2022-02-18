
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/add_button.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/screens/checkout_screens/pyment_screen.dart';
import 'package:newapexproject/screens/profile_screen/profile_screen.dart';

import '../../constant.dart';
import 'confirmation_bill.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Checkout',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              K.sizedBoxH,
              Stack(
                children: [
                  SizedBox(
                    height: 400.h,
                    width: 500.w,
                    child: Card(
                      color: K.borderColor,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0.w, vertical: 5.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                K.sizedBoxH,
                                Text(
                                  'Shipping Information',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8.sp),
                                ),
                                K.sizedBoxH,
                                Wrap(
                                  children: [
                                    InkWell(
                                      child: Icon(
                                        EvaIcons.personOutline,
                                        color: Colors.black.withOpacity(.7),
                                        size: 10.w,
                                      ),
                                      onTap: () {
                                        Get.to(ProfileScreen());
                                      },
                                    ),
                                    K.sizedBoxW,
                                    Text('Cameron Williamson',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(.7),
                                          fontSize: 6.sp,
                                          fontWeight: FontWeight.w500,
                                        ))
                                  ],
                                ),
                                K.sizedBoxH,
                                Wrap(
                                  children: [
                                    Icon(
                                      EvaIcons.phoneCallOutline,
                                      color: Colors.black.withOpacity(.7),
                                      size: 10.w,
                                    ),
                                    K.sizedBoxW,
                                    Text(
                                      '(405) 555-0120 ',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(.7),
                                        fontSize: 6.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                K.sizedBoxH,
                                Wrap(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.black.withOpacity(.7),
                                      size: 10.w,
                                    ),
                                    K.sizedBoxW,
                                    SizedBox(
                                      width: 100.w,
                                      child: Text(
                                        ' 8502 Perston Rd.inglewoold Main 98380.dunken St . near to Gazoline berline station',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(.7),
                                          fontSize: 6.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 3,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // left: Get.width*.74,
                    left: width * 0.74,
                    top: -8.h,
                    child: TextButton(
                      style: TextButton.styleFrom(
                      backgroundColor: K.mainColor,
                      shape: CircleBorder()),
                      onPressed: () {
                        Get.to(ProfileScreen());
                      },
                      child: Icon(
                        EvaIcons.edit2Outline,
                        color: Colors.white,
                        size: 8.sp,
                      ),
                    ),
                  ),
                ],
              ),
              K.sizedBoxH,
              Stack(
                children: [
                  SizedBox(
                    // margin: EdgeInsets.only(bottom: 15),
                    height: 300.h,
                    width: 500.w,
                    child: Card(
                      color: K.mainColor,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0.w, vertical: 5.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                K.sizedBoxH,
                                Text(
                                  'Payment',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: K.whiteColor,
                                      fontSize: 8.sp),
                                ),
                                K.sizedBoxH,
                                Wrap(
                                  children: [
                                    Icon(
                                      EvaIcons.printer,
                                      color: K.whiteColor,
                                      size: 10.w,
                                    ),
                                    K.sizedBoxW,
                                    Text(
                                      '561056729001767',
                                      style: TextStyle(
                                        color: K.whiteColor,
                                        fontSize: 6.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                K.sizedBoxH,
                                Wrap(
                                  children: [
                                    Text(
                                      '12 /26',
                                      style: TextStyle(
                                        color: K.whiteColor,
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    K.sizedBoxW,
                                    Text(
                                      '395',
                                      style: TextStyle(
                                        color: K.whiteColor,
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                K.sizedBoxH,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: width * 0.74,
                    top: -6.h,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: K.borderColor,
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {
                        Get.to(PaymentScreen());
                      },
                      child: Icon(
                        EvaIcons.edit2Outline,
                        color: Colors.black,
                        size: 8.sp,
                      ),
                    ),
                  ),
                ],
              ),
              K.sizedBoxH,
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w, vertical: 8.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub Total',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 6.sp,
                          ),
                        ),
                        Text(
                          '\$360.00',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 6.sp,
                              color: K.mainColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w, vertical: 8.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 6.sp,
                          ),
                        ),
                        Text(
                          '\$40.00',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 6.sp,
                            color: K.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.0.w, vertical: 8.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 8.sp,
                          ),
                        ),
                        Text(
                          '\$400.00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 6.sp,
                            color: K.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: AddButton(
                  text: 'Place Order',
                  onPressed: () {
                    Get.to(ConfirmationBill());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
