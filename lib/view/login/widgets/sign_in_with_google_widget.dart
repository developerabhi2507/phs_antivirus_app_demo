import 'package:antivirus_app_demo1/res/components/icon_with_round_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/assets/assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class SignInWithGoogleButton extends StatelessWidget {
  SignInWithGoogleButton({
    super.key,
  });

  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (loginViewModel.isContinueButtonPressed.value) {
        return IconWithRoundButtonWidget(
            width: Get.width - (Get.width - 300),
            buttonColor: Theme.of(context).brightness == Brightness.dark
                ? AppColor.buttonBg1Dark
                : AppColor.buttonBg1Light,
            image: Image.asset(AssetConstants.googleIcon),
            title: 'sign_in_with_google'.tr,
            onPress: () {
              loginViewModel.onGoogleSignInButtonPressed();
            });
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
