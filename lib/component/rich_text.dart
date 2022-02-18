import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newapexproject/constant.dart';

class FixedRichText extends StatelessWidget {
  final String? leftLabel;
  final String? rightLabel;
  final Function()? onTab;

  const FixedRichText({Key? key, this.leftLabel, this.rightLabel, this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: leftLabel,
            style: const TextStyle(color: K.grayColor, fontSize: 15),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap = onTab,
                text: rightLabel,
                style: const TextStyle(fontSize: 15, color: K.mainColor),
              )
            ]));
  }
}
