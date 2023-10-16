import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/utils/theme_constants.dart';
import '../../../../res/utils/utils.dart';
import '../../../../view_models/controllers/redeem_sub_view_model/partner_code_view_model.dart';

class InputPartnerCodeWidget extends StatelessWidget {
  InputPartnerCodeWidget({super.key});

  final partnerCodeViewModel = Get.put(PartnerCodeViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: partnerCodeViewModel.partnerCode.value,
      focusNode: partnerCodeViewModel.partnerCodeFocusNode.value,
      style: Theme.of(context).textTheme.bodySmall,
      cursorColor: AppColor.cursor,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Product Key', 'Enter Product-Key');
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(
            context,
            partnerCodeViewModel.partnerCodeFocusNode.value,
            partnerCodeViewModel.partnerCodeFocusNode.value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: ThemeConstants.defaultBorderRadius,
          borderSide: const BorderSide(
            color: AppColor.border1,
          ),
        ),
        hintText: 'partner_code_hint'.tr,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        // .copyWith(
        //   color: const Color(0xFF000000)
        //       .withOpacity(0.4),
        //   fontSize: 14,
        //   fontWeight: FontWeight.w700,
        // ),
        fillColor: Get.isDarkMode ? AppColor.bg4Dark : AppColor.bg4Light,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.border1),
          borderRadius: ThemeConstants.smallBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.border1),
          borderRadius: ThemeConstants.smallBorderRadius,
        ),
      ),
    );
  }
}
