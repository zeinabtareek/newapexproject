import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/component/ticket.dart';

import '../constant.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final double price;
  final double? discount;
  final double? width;
  final String text;

  const ProductCard({
    Key? key,
    required this.image,
    required this.text,
    required this.price,
    this.discount,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1, // you can play with this value, by default it is 1
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width.w,
            height: MediaQuery.of(context).size.height * .55.h,
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAlias,
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    image,
                    height: MediaQuery.of(context).size.height * .24.h,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w, vertical: 8.0.h),
                    child: Wrap(
                      spacing: 3,
                      runSpacing: 3,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            height: 2.h,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: K.blackColor,
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            RatingBarIndicator(
                              rating: 2.75,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 15.0.sp,
                              direction: Axis.horizontal,
                            ),
                            K.sizedBoxW,
                            Text(
                              '(4.2)',
                              style: TextStyle(
                                color: K.grayColor,
                                fontSize: 16.sp,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$$price',
                              style: TextStyle(
                                color: K.blackColor,
                                fontSize: 16.sp,
                              ),
                            ),
                            Divider(),
                            Text(
                              '\$ $discount',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: K.grayColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'In Stock',
                              style: TextStyle(
                                height: 2.h,
                                color: Color(0xfffd0503),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Container(
                              color: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0.w, vertical: 8.0.h),
                              child: Wrap(
                                runSpacing: 20.h,
                                textDirection: TextDirection.rtl,
                                children: [
                                  AutoSizeText(
                                    'Add to Cart',
                                    style: TextStyle(
                                        color: K.whiteColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    EvaIcons.shoppingCartOutline,
                                    color: K.whiteColor,
                                    size: 25.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TicketWidget(width: width!),
          ),
        ],
      ),
    );
  }
}
