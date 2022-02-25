import 'package:newapexproject/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixedTextField extends StatelessWidget {
  const FixedTextField({Key? key, this.label, this.function}) : super(key: key);
  final String? label;
  final Function(String)? function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.0.h),
      child: TextFormField(
        onChanged: function,
        showCursor: true,
        cursorColor: K.mainColor,
        decoration: InputDecoration(
            border: InputBorder.none,
            label: Text(
              label!,
              style: TextStyle(
                  color: K.grayColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp),
            ),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: K.grayColor)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: K.borderColor))),
      ),
    );
  }
}
