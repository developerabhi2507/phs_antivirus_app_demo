import 'package:antivirus_app_demo1/res/colors/app_color.dart';
import 'package:antivirus_app_demo1/res/components/text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/controllers/login_options_controller.dart';

class RedeemBottomSheet extends StatelessWidget {
  const RedeemBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final loginOptionsViewModel = Get.put(LoginOptionsViewModel());
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width - (Get.width - 20),
          vertical: Get.height - (Get.height - 29)),
      // height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'redeem_message'.tr,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: Get.height - (Get.height - 20),
          ),
          CustomTextButton(
            title: 'product_key_button'.tr,
            onPress: () => loginOptionsViewModel.productKey(),
            textColor: Get.isDarkMode
                ? AppColor.buttonFg4Dark
                : AppColor.buttonFg4Light,
          ),
          CustomTextButton(
            title: 'partner_code_button'.tr,
            onPress: () => loginOptionsViewModel.partnerCode(),
            textColor: Get.isDarkMode
                ? AppColor.buttonFg4Dark
                : AppColor.buttonFg4Light,
          ),
        ],
      ),
    );
  }
}
