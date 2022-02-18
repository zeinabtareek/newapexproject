import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constant.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
        this.onTap,
        this.label,
        this.price,
        this.favouriteFun,
        this.iconData,
        this.images})
      : super(key: key);
  final Function()? onTap;
  final String? label;
  final String? price;
  final Function()? favouriteFun;
  final IconData? iconData;
  final String? images;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(
            color: Colors.white,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Image.network(
                    images!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: favouriteFun,
                      icon: Icon(
                        iconData,
                        size: 25,
                        color: K.grayColor,
                      ),
                    ),
                    top: 10,
                    right: 4,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: K.blackColor,
                      fontFamily: "Poppins-Bold",
                    ),
                  ),
                  Text(
                    price!,
                    style: const TextStyle(
                      color: K.grayColor,
                      fontSize: 16,
                    ),
                  ),
                  const Text('In Stock',
                      style: TextStyle(
                        color: K.cardColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                      const Icon(
                        EvaIcons.shoppingCartOutline,
                        color: K.grayColor,
                        size: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
