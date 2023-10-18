import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../res/components/round_button_widget.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class ContinueButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  ContinueButtonWidget({super.key, required this.formKey});
  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (loginViewModel.isContinueButtonPressed.value) {
        return RoundButton(
            width: Get.width - (Get.width - 300),
            buttonColor: Theme.of(context).brightness == Brightness.dark
                ? AppColor.buttonBg1Dark
                : AppColor.buttonBg1Light,
            title: 'continue_button'.tr,
            loading: loginViewModel.loading.value,
            onPress: () {
              loginViewModel.loading.value = true;
              if (formKey.currentState!.validate() &&
                  loginViewModel.emailController.value.text.isNotEmpty) {
                loginViewModel.onContinueButtonPressed();
              } else {
                print('Error');
                loginViewModel.loading.value = false;
              }
            });
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
