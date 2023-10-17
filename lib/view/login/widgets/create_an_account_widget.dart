import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/text_button_widget.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class CreateAnAccountWidget extends StatelessWidget {
  CreateAnAccountWidget({super.key});
  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    if (loginViewModel.isButtonPressed.value) {
      return const SizedBox.shrink();
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'new_user_text'.tr,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
            ),
            SizedBox(width: Get.width - (Get.width - 5)),
            CustomTextButton(
                title: 'create_account'.tr,
                textAlignment: Alignment.centerLeft,
                textDecoration: TextDecoration.underline,
                onPress: loginViewModel.onCreateAccountButtonPressed),
          ],
        ),
      );
    }
  }
}
