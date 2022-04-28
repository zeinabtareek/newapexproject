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
            child: Container(
              clipBehavior: Clip.antiAlias,
              width: 75.w,
              height: 75.h,
              child: Center(
                child: Image.asset(
                  images!,
                  fit: BoxFit.contain,
                  width: 60.w,
                  height: 50.h,
                ),
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],

                  // border: Border.all(color: K.grayColor),
                  color: K.whiteColor,
                  shape: BoxShape.circle),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          AutoSizeText(
            labels!,
            style: TextStyle(color: K.blackColor, fontSize: 6.sp),
          ),
        ],
      ),
    );
  }
}
