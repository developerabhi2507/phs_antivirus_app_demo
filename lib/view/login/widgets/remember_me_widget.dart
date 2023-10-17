import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/controllers/login/login_view_model.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Get.put(LoginViewModel());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Custom Circular Checkbox
        GestureDetector(
          onTap: () {
            loginViewModel
                .onRememberMeChanged(!loginViewModel.rememberMe.value);
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: loginViewModel.rememberMe.value
                    ? Colors.blue
                    : Colors.transparent,
              ),
              child: loginViewModel.rememberMe.value
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : const SizedBox(), // Show an empty SizedBox when not checked
            ),
          ),
        ),
        SizedBox(width: Get.width - (Get.width - 10)),
        Text(
          'remember_me'.tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
