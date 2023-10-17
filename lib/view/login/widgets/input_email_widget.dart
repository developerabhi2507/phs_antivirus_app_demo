import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../res/utils/utils.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});

  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginViewModel.emailController.value,
      focusNode: loginViewModel.emailFocusNode.value,
      style: Theme.of(context).textTheme.bodyLarge,
      cursorColor: AppColor.cursor,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Email', 'Enter Email');
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, loginViewModel.emailFocusNode.value,
            loginViewModel.passwordFocusNode.value);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        labelText: 'username_label'.tr,
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
