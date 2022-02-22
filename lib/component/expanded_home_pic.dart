
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandedHomePicture extends StatelessWidget {
 final  String image;
  const ExpandedHomePicture({
    Key? key, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          image,
          height: 200.h,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
