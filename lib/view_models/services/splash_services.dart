import 'dart:async';

import 'package:antivirus_app_demo1/res/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashServices {
  void isFetchDetails() {
    Timer(const Duration(seconds: 0),
        () => Get.toNamed(RouteName.fetchDetailsView));
  }
}
