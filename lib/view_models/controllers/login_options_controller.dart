// presentation/controllers/login_options_controller.dart

import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';

class LoginOptionsViewModel extends GetxController {
  // Add methods to handle button clicks or any other actions in the LoginOptionsScreen

  void chooseYourPlan() {
    // Implement the logic to handle the "Choose Your Plan" button click
    // For example, you can navigate to the next screen using Get.to():
    // Get.to(NextScreen());
  }

  void signIn() {
    // Implement the logic to handle the "Sign In" button click
    // For example, you can navigate to the sign-in screen using Get.to():
    Get.toNamed(RouteName.signInView);
  }

  void productKey() {
    // Implement the logic to handle the "Sign In" button click
    // For example, you can navigate to the sign-in screen using Get.to():
    Get.offNamed(RouteName.productKeyView);
  }

  void partnerCode() {
    // Implement the logic to handle the "Sign In" button click
    // For example, you can navigate to the sign-in screen using Get.to():
    Get.offNamed(RouteName.partnerCodeView);
  }
}
