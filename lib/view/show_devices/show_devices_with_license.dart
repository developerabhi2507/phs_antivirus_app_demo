import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/components/round_button_widget.dart';
import '../../res/utils/theme_constants.dart';

class SelectDevWithLicenseView extends StatefulWidget {
  const SelectDevWithLicenseView({super.key});

  @override
  State<SelectDevWithLicenseView> createState() =>
      _SelectDevWithLicenseViewState();
}

class _SelectDevWithLicenseViewState extends State<SelectDevWithLicenseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      margin: EdgeInsets.only(top: Get.height - (Get.height - 50)),
      padding: ThemeConstants.defaultPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'select_license_screen_title'.tr,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: Get.height - (Get.height - 42),
          ),
          Text(
            'select_license_message'.tr,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: Get.height - (Get.height - 28),
          ),
          SizedBox(
            width: double.infinity,
            height: Get.height - (Get.height - 47),
            child: RoundButton(title: 'next_button'.tr, onPress: () {}),
          )
        ],
      ),
    )));
  }
}
