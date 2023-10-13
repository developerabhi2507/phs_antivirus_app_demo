import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width - (Get.width - 30)),
      child: RichText(
        textAlign: TextAlign.center,
        maxLines: 3,
        text: TextSpan(
            style: Theme.of(context).textTheme.bodySmall,
            children: <TextSpan>[
              TextSpan(
                text: 'privacy_policy1'.tr,
              ),
              _createGestureTextSpan('privacy_policy2'.tr,
                  Theme.of(context).textTheme.displayMedium, () {
                if (kDebugMode) {
                  print('tap on License and Services Agreement');
                }
              }),
              TextSpan(
                text: 'privacy_policy3'.tr,
              ),
              _createGestureTextSpan('privacy_policy4'.tr,
                  Theme.of(context).textTheme.displayMedium, () {
                if (kDebugMode) {
                  print('tap on Global Privacy Statement');
                }
              }),
            ]),
      ),
    );
  }
}

TextSpan _createGestureTextSpan(
    String text, TextStyle? style, VoidCallback? onTap) {
  if (onTap != null) {
    return TextSpan(
      text: text,
      style: style,
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  } else {
    return TextSpan(
      text: text,
      style: style ?? TextStyle(), // Use a default style if style is null
    );
  }
}
