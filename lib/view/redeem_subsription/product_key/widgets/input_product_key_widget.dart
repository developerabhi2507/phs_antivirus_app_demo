import 'package:antivirus_app_demo1/res/colors/app_color.dart';
import 'package:antivirus_app_demo1/view_models/controllers/redeem_sub_view_model/product_key_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/utils/theme_constants.dart';
import '../../../../res/utils/utils.dart';

class InputProductKeyWidget extends StatelessWidget {
  InputProductKeyWidget({super.key});

  final productKeyViewModel = Get.put(ProductKeyViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: productKeyViewModel.productKey.value,
      focusNode: productKeyViewModel.productKeyFocusNode.value,
      inputFormatters: [ProductKeyFormatter()],
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
            productKeyViewModel.productKeyFocusNode.value,
            productKeyViewModel.productKeyFocusNode.value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: ThemeConstants.smallBorderRadius,
          borderSide: BorderSide(
            color: productKeyViewModel.productKey.value.text.length > 25
                ? AppColor.errorColor
                : AppColor.border1,
          ),
        ),
        hintText: 'product_key_hint'.tr,
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
