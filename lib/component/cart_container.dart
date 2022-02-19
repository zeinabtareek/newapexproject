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
        height: 130.h,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(2),
                  topRight: Radius.circular(2)),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                image!,
                fit: BoxFit.cover,
                width: 140.w,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric
                  (horizontal: 8.0.w ,vertical: 8.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      label!,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: K.blackColor,
                          fontWeight: FontWeight.w600),
                    ),
                    AutoSizeText(
                      price!,

                      style: TextStyle(
                          fontSize: 15.sp,
                          color: K.mainColor,
                          height: 1.9.h,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: clear,
                    icon:  Icon(MdiIcons.cartRemove,
                        size: 20.sp, color: K.mainColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: decrease,
                          icon:  Icon(MdiIcons.minusCircle,
                              size: 25.sp,
                              color: K.mainColor),
                        ),
                        const Text(
                          '2',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        IconButton(
                          onPressed: increase,
                          icon:  Icon(
                            MdiIcons.plusCircle,
                            size: 25.sp,
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
