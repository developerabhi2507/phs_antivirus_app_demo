import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/assets/assets.dart';
import '../../../res/colors/app_color.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Get.isDarkMode
            ? AppColor.bg1Dark.withOpacity(0.4)
            : AppColor.bg1Light.withOpacity(-0.5 + 1.0),
        BlendMode.srcATop,
      ),
      child: Image.asset(
        AssetConstants.loginBackground,
        fit: BoxFit.cover,
        height: Get.height - (Get.height - 288),
        width: Get.width - (Get.width - 360),
      ),
    );
  }
}
