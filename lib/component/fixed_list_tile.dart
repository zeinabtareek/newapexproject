import 'package:flutter/material.dart';
import 'package:newapexproject/constant.dart';

class FixedListTile extends StatelessWidget {
  const FixedListTile(
      {Key? key, this.onTap, this.iconLeading, this.subTitle, this.title})
      : super(key: key);
  final String? title;
  final String? subTitle;
  final IconData? iconLeading;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        onTap: onTap,
        leading: Icon(
          iconLeading!,
          color: K.blackColor,
          size: 30,
        ),
        title: Text(
          title!,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, height: 1),
        ),
        subtitle: Text(
          subTitle!,
          maxLines: 1,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, height: 1),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20,
        ),
      ),
    );
  }
}
