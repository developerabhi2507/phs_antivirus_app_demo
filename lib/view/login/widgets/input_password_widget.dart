import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../res/utils/utils.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});

  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginViewModel.passwordController.value,
      focusNode: loginViewModel.passwordFocusNode.value,
      style: Theme.of(context).textTheme.bodyLarge,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Password', 'Enter Password');
        }
        return null;
      },
      onFieldSubmitted: (value) {},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        labelText: 'password_label'.tr,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.border1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.border1),
        ),
      ),
    );
  }
}
