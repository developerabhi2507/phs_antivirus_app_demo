import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../res/components/round_button_widget.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class SignInButtonWidget extends StatelessWidget {
  SignInButtonWidget({super.key});
  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return RoundButton(
        width: Get.width - (Get.width - 300),
        buttonColor: Theme.of(context).brightness == Brightness.dark
            ? AppColor.buttonBg1Dark
            : AppColor.buttonBg1Light,
        title: 'continue_button'.tr,
        onPress: () {
          loginViewModel.onSignInButtonPressed();
        });
  }
}
