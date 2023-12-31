import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../res/components/round_button_widget.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class SignInButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  SignInButtonWidget({super.key, required this.formKey});
  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (loginViewModel.isSignInButtonPressed.value) {
        final buttonColor = Theme.of(context).brightness == Brightness.dark
            ? AppColor.buttonBg1Dark
            : AppColor.buttonBg1Light;

        return RoundButton(
            width: Get.width - (Get.width - 300),
            buttonColor: buttonColor,
            loading: loginViewModel.loading.value,
            title: 'sign_in_button'.tr,
            onPress: () {
              if (formKey.currentState!.validate() &&
                  loginViewModel.passwordController.value.text.isNotEmpty) {
                loginViewModel.loginApi();
              }
            });
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
