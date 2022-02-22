import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class PaymentGroupe extends StatelessWidget {
  const PaymentGroupe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            AutoSizeText(
              'Sub Total',
              style: TextStyle(
                fontWeight: FontWeight.w500, fontSize:16.sp,
              ),
            ),
            AutoSizeText(
              '\$360.00',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize:16.sp,
                  color: K.mainColor),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            AutoSizeText(
              'Shipping',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize:16.sp, height: 2.h),
            ),
            AutoSizeText(
              '\$40.00',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize:16.sp,
                  color: K.mainColor,
                  height: 2.h),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            AutoSizeText(
              'Total',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize:18.sp, height: 3.h),
            ),
            AutoSizeText(
              '\$400.00',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize:18.sp,
                  color: K.mainColor,
                  height: 3.h),
            ),
          ],
        ),
      ],
    );
  }
}
