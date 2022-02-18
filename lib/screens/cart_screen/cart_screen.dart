
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: CustomAppBar(
        label: "Cart",
        actions: [
          Icon(
            EvaIcons.shoppingCart,
            color: K.mainColor,
          ),
          K.sizedBoxW,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Cart(
                      price: "\$250",
                      label: "Fashion",
                      image: "assets/images/kit.jpg",
                      decrease: () {},
                      increase: () {},
                      clear: () {},
                    );
                  }),
              K.sizedBoxH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Sub Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '\$360.00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: K.mainColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Shipping',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18, height: 2),
                  ),
                  Text(
                    '\$40.00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: K.mainColor,
                        height: 2),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20, height: 3),
                  ),
                  Text(
                    '\$400.00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: K.mainColor,
                        height: 3),
                  ),
                ],
              ),
              AddButton(
                text: 'Checkout',
                onPressed: () {
                  Get.to(AddressScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
