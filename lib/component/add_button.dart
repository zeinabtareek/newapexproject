import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class AddButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;

  const AddButton({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: TextStyle(
          color: K.whiteColor,
          fontSize: 7.sp,
          fontFamily: "Poppins SemiBold",
        ),
      ),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(150.w, 80.h),
          primary: K.blackColor,
          // primary:Color(0xFFF5F5F5),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
