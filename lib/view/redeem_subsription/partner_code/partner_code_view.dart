import 'package:antivirus_app_demo1/res/components/round_button_widget.dart';
import 'package:antivirus_app_demo1/view/redeem_subsription/partner_code/widgets/input_partner_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/utils/theme_constants.dart';

class PartnerCodeView extends StatelessWidget {
  const PartnerCodeView({super.key});

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
            'partner_code_title'.tr,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: Get.height - (Get.height - 42),
          ),
          Text(
            'partner_code_message'.tr,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: Get.height - (Get.height - 28),
          ),
          SizedBox(
            height: Get.height - (Get.height - 50),
            child: InputPartnerCodeWidget(),
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
