import 'package:antivirus_app_demo1/view/fetching_product_details.dart';
import 'package:antivirus_app_demo1/view/login/login_view.dart';
import 'package:antivirus_app_demo1/view/login_options/login_options_view.dart';
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
            page: () => const LoginOptionsView(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.partnerCodeView,
            page: () => const LoginOptionsView(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.signInView,
            page: () => const SignInView(),
            transitionDuration: const Duration(milliseconds: 100),
            transition: Transition.leftToRightWithFade),
      ];
}
