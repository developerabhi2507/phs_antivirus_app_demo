import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/text_button_widget.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class SignInWithDifferentAccWidget extends StatelessWidget {
  SignInWithDifferentAccWidget({super.key});
  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    if (loginViewModel.isButtonPressed.value) {
      return CustomTextButton(
          title: 'different_account'.tr,
          textDecoration: TextDecoration.underline,
          textAlignment: Alignment.centerLeft,
          onPress: loginViewModel.onSignInWithDifferentAcc);
    } else {
      return const SizedBox.shrink();
    }
  }
}
