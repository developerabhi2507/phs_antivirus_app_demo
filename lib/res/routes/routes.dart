import 'package:antivirus_app_demo1/view/fetching_product_details.dart';
import 'package:antivirus_app_demo1/view/login/login_view.dart';
import 'package:antivirus_app_demo1/view/login_options/login_options_view.dart';
import 'package:antivirus_app_demo1/view/redeem_subsription/partner_code/partner_code_view.dart';
import 'package:antivirus_app_demo1/view/redeem_subsription/product_key/product_key_view.dart';
import 'package:antivirus_app_demo1/view/show_devices/show_devices_with_license.dart';
import 'package:get/get.dart';

import '../../view/splash_screen.dart';
import 'routes_name.dart';

class AppRoutes {
  static const initial = '/';
  static appRoutes() => [
        GetPage(
            name: RouteName.splashView,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.fetchDetailsView,
            page: () => const FetchProductDetailsScreen(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.loginOptionsView,
            page: () => const LoginOptionsView(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.productKeyView,
            page: () => const ProductKeyView(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.partnerCodeView,
            page: () => const PartnerCodeView(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.signInView,
            page: () => const SignInView(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.selectDevice,
            page: () => const SelectDevWithLicenseView(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.leftToRightWithFade),
      ];
}
