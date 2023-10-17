import 'package:antivirus_app_demo1/view_models/controllers/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/text_button_widget.dart';

class ForgotPasswordWidget extends StatelessWidget {
  ForgotPasswordWidget({super.key});
  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
        title: 'forgot_username'.tr,
        textAlignment: Alignment.centerLeft,
        onPress: loginViewModel.onForgotUsernameButtonPressed);
  }
}
