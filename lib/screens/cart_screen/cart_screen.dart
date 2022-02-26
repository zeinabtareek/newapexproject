
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/component/payment_group.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/add_button.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/component/cart_container.dart';
import 'package:newapexproject/screens/order_screens/address_screen.dart';
import '../../constant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(label: "Cart",
      actions: [Icon(EvaIcons.shoppingCart, color: K.mainColor,), SizedBox(width: 6.w),],
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Wrap(
            children: [
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Cart(
                                price: "\$250",
                                label: "Fashion",
                                image: "https://api.khofow.com/storage/uploads/TSDEqe-1638228474.jpg",
                                decrease: () {},
                                increase: () {},
                                clear: () {},
                              );
                  }),
              K.sizedBoxH,
              PaymentGroupe(),
              Center(
                child: AddButton(
                  text: 'Checkout',
                  onPressed: () {
                    Get.to(AddressScreen());
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
