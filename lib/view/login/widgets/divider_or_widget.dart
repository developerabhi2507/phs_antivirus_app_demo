import 'package:antivirus_app_demo1/view_models/controllers/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../res/utils/theme_constants.dart';

class DividerOrTextWidget extends StatelessWidget {
  DividerOrTextWidget({super.key});
  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    if (loginViewModel.isButtonPressed.value) {
      return const SizedBox.shrink();
    } else {
      return Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColor.divider,
              thickness: 1,
            ),
          ),
          Padding(
            padding: ThemeConstants.smallPadding,
            child: Text('divider_text'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18)),
          ),
          const Expanded(
            child: Divider(
              color: AppColor.divider,
              thickness: 1,
            ),
          ),
        ],
      );
    }
  }
}
