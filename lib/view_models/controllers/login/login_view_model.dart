import 'package:antivirus_app_demo1/models/login/user_model.dart';
import 'package:antivirus_app_demo1/repository/login_repository/login_repository.dart';
import 'package:antivirus_app_demo1/res/routes/routes_name.dart';
import 'package:antivirus_app_demo1/res/utils/utils.dart';
import 'package:antivirus_app_demo1/view_models/controllers/user_prefrences/user_prefrence_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  // Controller properties and logic go here
  final RxString appBarTitle = 'sign_in_title'.tr.obs;
  final RxString buttonText = 'continue_button'.tr.obs;
  final isButtonPressed = false.obs;
  final rememberMe = false.obs;
  final RxBool loading = false.obs;

  final _api = LoginRepository();

  UserPrefences userPrefences = UserPrefences();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  void loginApi() {
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        userPrefences
            .saveUser(UserModel.fromJson(value))
            .then((value) {})
            .onError((error, stackTrace) {});
        Utils.snackBar('Login', 'Login successfully.');
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }

  void onContinueButtonPressed() {
    final formkey = GlobalKey<FormState>();
    // Implement the logic for the Continue button here
    appBarTitle.value = 'password_title'.tr;
    buttonText.value = 'sign_in_button'.tr;
    isButtonPressed.value = true;
    loading.value = true;
    if (formkey.currentState!.validate()) {}
    if (!isButtonPressed.value) {
      // loginApi();
      Get.toNamed(RouteName.selectDevice);
    }
    update();
  }

  void onRememberMeChanged(bool? value) {
    rememberMe.value = value!;
  }

  void onGoogleSignInButtonPressed() {
    // Implement the logic for the Google Sign-In button here
  }

  void onSignInButtonPressed() {
    // Implement the logic for the "Sign In" button here
  }

  void onForgotUsernameButtonPressed() {
    // Implement the logic for the "Forgot username?" button here
  }

  void onRequestOneTimePasswordButtonPressed() {
    // Implement the logic for the "Request one-time password" button here
  }

  void onCreateAccountButtonPressed() {
    // Implement the logic for the "Create an account" button here
  }

  void onSignInWithDifferentAcc() {
    // Implement the logic for the "Create an account" button here
  }
}
