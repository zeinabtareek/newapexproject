import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constant.dart';

class Cart extends StatelessWidget {
  final Function()? increase;
  final Function()? decrease;
  final Function()? clear;
  final String? image;
  final String? label;
  final String? price;

  const Cart(
      {Key? key,
        this.label,
        this.price,
        this.image,
        this.clear,
        this.decrease,
        this.increase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: K.whiteColor,
      child: SizedBox(
        height: 200.h,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(2),
                  topRight: Radius.circular(2)),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                image!,
                fit: BoxFit.cover,
                width: 55.w,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: AutoSizeText(
                      label!,
                      style: TextStyle(
                          fontSize: 7.sp,
                          color: K.blackColor,
                          fontFamily: "Poppins-Bold"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: AutoSizeText(
                      price!,
                      style: TextStyle(
                          fontSize: 6.sp,
                          color: K.mainColor,
                          fontFamily: "Poppins-Bold"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: clear,
                    icon: const Icon(MdiIcons.cartRemove,
                        size: 25, color: K.mainColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: decrease,
                          icon: const Icon(MdiIcons.minusCircle,
                              size: 30, color: K.mainColor),
                        ),
                        const Text(
                          '2',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: increase,
                          icon: const Icon(
                            MdiIcons.plusCircle,
                            size: 30,
                            color: K.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
