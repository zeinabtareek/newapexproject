import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class CircleCard extends StatelessWidget {
  const CircleCard({Key? key, this.labels, this.images, this.onTap})
      : super(key: key);
  final String? images;
  final String? labels;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Material(
              clipBehavior: Clip.antiAlias,
              elevation: 1,
              borderRadius: BorderRadius.circular(50),
              shadowColor: K.grayColor,
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 70.w,
                height: 70.h,
                child: Center(
                  child: Image.asset(
                    images!,
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                decoration: BoxDecoration(
                  // border: Border.all(color: K.grayColor),
                    color: K.whiteColor,
                    shape: BoxShape.circle),
              ),
            ),
          ),
          K.sizedBoxH,
          AutoSizeText(
            labels!,
            style: TextStyle(color: K.blackColor, fontSize: 6.sp),
          ),
        ],
      ),
    );
  }
}
