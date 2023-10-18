import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/text_button_widget.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class SignInWithServiceProviderWidget extends StatelessWidget {
  SignInWithServiceProviderWidget({super.key});
  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextButton(
              title: 'sign_in_text_button'.tr,
              textAlignment: Alignment.centerLeft,
              textDecoration: TextDecoration.underline,
              onPress: loginViewModel.onSignInButtonWithProviderPressed),
          SizedBox(width: Get.width - (Get.width - 5)),
          Text(
            'sign_in_text'.tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
