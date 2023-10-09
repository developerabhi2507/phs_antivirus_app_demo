import 'package:antivirus_app_demo1/res/colors/app_color.dart';
import 'package:antivirus_app_demo1/res/components/round_button.dart';
import 'package:antivirus_app_demo1/res/components/text_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools;

import '../../res/assets/assets.dart';

class LoginOptionsView extends StatelessWidget {
  const LoginOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Image Widget
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Get.isDarkMode
                    ? AppColor.bg1Dark.withOpacity(0.4)
                    : AppColor.bg1Light.withOpacity(-0.5 + 1.0),
                BlendMode.srcATop,
              ),
              child: Image.asset(
                AssetConstants.loginBackground,
                fit: BoxFit.cover,
                height: Get.height - (Get.height - 288),
                width: Get.width - (Get.width - 360),
              ),
            ),
            Positioned(
              left: Get.width - (Get.width - 40),
              bottom: Get.height - (Get.height - 20),
              right: Get.width - (Get.width - 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'free_trial'.tr,
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Get.height - (Get.height - 8)),
                  Text(
                    'free_trial_message'.tr,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height - (Get.height - 20),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Get.width - (Get.width - 30)),
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
                    devtools.log('tap on License and Services Agreement');
                  }),
                  TextSpan(
                    text: 'privacy_policy3'.tr,
                  ),
                  _createGestureTextSpan('privacy_policy4'.tr,
                      Theme.of(context).textTheme.displayMedium, () {
                    devtools.log('tap on Global Privacy Statement');
                  }),
                ]),
          ),
        ),
        SizedBox(
          height: Get.height - (Get.height - 20),
        ),
        RoundButton1(
            width: Get.width - (Get.width - 300),
            title: 'choose_plan_button'.tr,
            onPress: () {}),
        // Container(
        //   width: double.infinity,
        //   height: Get.height - (Get.height - 50),
        //   padding:
        //       EdgeInsets.symmetric(horizontal: Get.width - (Get.width - 30)),
        //   foregroundDecoration: BoxDecoration(
        //       borderRadius: BorderRadius.all(Radius.circular(20))),
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     style: Theme.of(context).elevatedButtonTheme.style,
        //     child: Text('choose_plan_button'.tr),
        //   ),
        // ),
        SizedBox(
          height: Get.height - (Get.height - 20),
        ),
        RoundButton1(
            width: Get.width - (Get.width - 300),
            buttonColor: AppColor.buttonBg2Light,
            textColor: AppColor.buttonFg2Light,
            borderColor: AppColor.border2,
            title: 'sign_in_button'.tr,
            onPress: () {}),
        // Container(
        //   width: double.infinity,
        //   height: Get.height - (Get.height - 50),
        //   padding:
        //       EdgeInsets.symmetric(horizontal: Get.width - (Get.width - 30)),
        //   foregroundDecoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(20)),
        //   ),
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     // onPressed: () => controller.signIn(),
        //     // style: ThemeConstants().elevatedStyle2,
        //     child: Text('sign_in_button'.tr),
        //   ),
        // ),
        SizedBox(
          height: Get.height - (Get.height - 16),
        ),
        CustomTextButton(
          title: 'redeem_button'.tr,
          onPress: () {
            _showRedeemSubscription(context);
          },
        )
        // TextButton(
        //   onPressed: () {
        //     _showRedeemSubscription(context);
        //   },
        //   style: Theme.of(context).textButtonTheme.style,
        //   child: Text(
        //     'redeem_button'.tr,
        //     textAlign: TextAlign.center,
        //   ),
        // ),
      ],
    ));
  }

  void _showRedeemSubscription(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (bottomSheetContext) {
        return Text('');
        // return const RedeemBottomSheet();
      },
    );
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
}
