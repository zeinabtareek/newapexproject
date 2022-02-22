

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant.dart';
import 'card_product2.dart';

class ResponsiveLayout extends StatefulWidget {
  @override
  _ResponsiveLayoutState createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, dimens) {
        if (dimens.maxWidth <= K.MobileBreakpoint) {
          return CustomGridView(columnRatio: 6, width: 100.w,  );
        } else if (dimens.maxWidth > K.MobileBreakpoint &&
            dimens.maxWidth <= K.TabletBreakpoint) {
          return CustomGridView(columnRatio: 6, width: 100.w, );
        } else if (dimens.maxWidth > K.TabletBreakpoint &&
            dimens.maxWidth <= K.DesktopBreakPoint) {
          return CustomGridView(columnRatio: 2,   width: 100.0.w, );
        } else {
          return CustomGridView(columnRatio: 2,  width: 100.w, );
        }
      },
    );
  }
}

