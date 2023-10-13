import 'package:antivirus_app_demo1/res/colors/app_color.dart';
import 'package:antivirus_app_demo1/res/components/round_button.dart';
import 'package:antivirus_app_demo1/res/components/text_button.dart';
import 'package:antivirus_app_demo1/view/login_options/widgets/background_image.dart';
import 'package:antivirus_app_demo1/view/login_options/widgets/positioned_widget.dart';
import 'package:antivirus_app_demo1/view/login_options/widgets/rich_text_widget.dart';
import 'package:antivirus_app_demo1/view_models/controllers/login_options_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/redeem_bottomsheet_widget.dart';

class LoginOptionsView extends StatelessWidget {
  const LoginOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginOptionsViewModel = Get.put(LoginOptionsViewModel());
    return Scaffold(
      body: Column(
        children: [
          const Stack(
            alignment: Alignment.center,
            children: [
              // Image Widget
              BackgroundImage(),
              PositionedWidget(),
            ],
          ),
          SizedBox(
            height: Get.height - (Get.height - 20),
          ),
          const RichTextWidget(),
          SizedBox(
            height: Get.height - (Get.height - 20),
          ),
          RoundButton(
              width: Get.width - (Get.width - 300),
              title: 'choose_plan_button'.tr,
              onPress: () => loginOptionsViewModel.chooseYourPlan()),
          SizedBox(
            height: Get.height - (Get.height - 20),
          ),
          RoundButton(
              width: Get.width - (Get.width - 300),
              buttonColor: AppColor.buttonBg2Light,
              textColor: AppColor.buttonFg2Light,
              borderColor: AppColor.border2,
              title: 'sign_in_button'.tr,
              onPress: () => loginOptionsViewModel.signIn()),
          SizedBox(
            height: Get.height - (Get.height - 16),
          ),
          CustomTextButton(
            title: 'redeem_button'.tr,
            onPress: () {
              if (kDebugMode) {
                print('show bottomsheet');
              }
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return const RedeemBottomSheet();
                },
              );
              // _showRedeemSubscription(context);
            },
          ),
        ],
      ),
    );
  }
}
