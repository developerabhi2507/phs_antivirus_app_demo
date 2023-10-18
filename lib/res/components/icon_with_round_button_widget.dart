import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/assets/assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class IconWithRoundButtonWidget extends StatelessWidget {
  final bool loading;
  final Image image;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final bool isPressed;
  final Color textColor, buttonColor, borderColor, overlayColor;

  IconWithRoundButtonWidget(
      {super.key,
      this.buttonColor = AppColor.buttonBg1Light,
      this.textColor = AppColor.buttonFg1Light,
      this.borderColor = AppColor.border1,
      this.overlayColor = AppColor.buttonOverLayLight,
      required this.image,
      required this.title,
      required this.onPress,
      this.isPressed = false,
      this.width = 60,
      this.height = 50,
      this.loading = false});

  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          // border: Border.all(color: borderColor),
          color: isPressed ? overlayColor : buttonColor,
        ),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: borderColor),
          ),
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image,
                    SizedBox(
                      width: Get.width - (Get.width - 10),
                    ),
                    Center(
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: textColor),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
