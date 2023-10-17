import 'package:antivirus_app_demo1/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PositionedWidget extends StatelessWidget {
  const PositionedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColor.text2Light.withOpacity(0.8), fontSize: 16),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
