import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors/app_color.dart';
import 'round_button_widget.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Icon(
            Icons.cloud_off,
            color: AppColor.blackColor,
          ),
          SizedBox(
            height: Get.height - (Get.height - 20),
          ),
          Text('internet_exception'.tr),
          SizedBox(
            height: Get.height - (Get.height - 20),
          ),
          RoundButton(title: 'exception_button_text'.tr, onPress: onPress)
        ],
      ),
    );
  }
}
