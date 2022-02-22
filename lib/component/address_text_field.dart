import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class AddressTextField extends StatelessWidget {
 final String label;
  const AddressTextField({
    Key? key,required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400.w,
        child: TextField(cursorHeight: 30,
          // onChanged:(){},
          cursorColor: K.mainColor,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:EdgeInsets.symmetric
              (horizontal: 20.0.w ,vertical: 30.0.h),
            hintText: label,
            hintStyle: TextStyle(color: K.grayColor,fontSize: 14.sp),
            fillColor: K.grayColor.withOpacity(.15),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: K.grayColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none
              // borderSide: BorderSide(color: K.grayColor,
            ),
          ),
        ),
      ),
    );
  }
}
