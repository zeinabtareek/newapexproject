
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/component/fixed_list_tile.dart';
import '../../constant.dart';
import '../checkout_screens/pyment_screen.dart';
import '../order_screens/address_screen.dart';
import '../order_screens/order_history.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProfileController());
    return Scaffold(
      appBar: const CustomAppBar(
        label: "Profile",
        actions: [],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                   Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        radius:90.w,
                        backgroundImage:
                        NetworkImage(
                            "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg",)),
                  ),
                  Positioned(
                    child: IconButton(
                        onPressed: () {},
                        icon:  Icon(
                          EvaIcons.camera,
                          size: 40.sp,
                          color: K.mainColor,
                        )),
                    bottom: 10.h,
                    right: 10.w,
                  ),
                ],
              ),
               Text(
                'Caroline John',
                softWrap: true,
                style: TextStyle(
                    color: K.blackColor,
                    fontFamily: 'Poppins-Bold',
                    fontSize: 16.sp),
              ),
               Text(
                'johnmatilda@gmail.com \n',
                softWrap: true,
                style: TextStyle(
                    color: K.grayColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp),
              ),
              ListView.builder(
                  itemCount: _controller.labels.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric
                  (horizontal: 2.0.w ,vertical: 2.0.h),
                  itemBuilder: (ctx, index) => FixedListTile(
                        onTap: () {
                          if (index == 0) {
                            Get.to(OrderHistory());
                          } else if (index == 1) {
                            Get.to(PaymentScreen());
                          } else if (index == 2) {
                            Get.to(AddressScreen());
                          } else if (index == 3) {}
                        },
                        title: _controller.labels[index],
                        subTitle: _controller.subTitle[index],
                        iconLeading: _controller.icons[index],
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
