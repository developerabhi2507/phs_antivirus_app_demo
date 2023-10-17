import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/text_button_widget.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class RequestOneTimepasswordWidget extends StatelessWidget {
  RequestOneTimepasswordWidget({super.key});

  final loginViewModel = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
        title: 'one_time_passwordButton'.tr,
        textAlignment: Alignment.centerLeft,
        onPress: loginViewModel.onRequestOneTimePasswordButtonPressed);
  }
}
