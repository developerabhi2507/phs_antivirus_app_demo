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
  final isContinueButtonPressed = true.obs;
  final isSignInButtonPressed = false.obs;
  final rememberMe = false.obs;
  RxBool loading = false.obs;

  final _api = LoginRepository();
  final formkey = GlobalKey<FormState>();
  UserPrefences userPrefences = UserPrefences();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(token: value['token'], isLogin: true);
        userPrefences.saveUser(userModel).then((value) {
          Get.delete<LoginViewModel>();
          Get.toNamed(RouteName.selectDevice)!.then((value) {});
        }).onError((error, stackTrace) {
          loading.value = false;
        });
        Utils.snackBar('Login', 'Login successfully.');
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }

  void onContinueButtonPressed() {
    // Implement the logic for the Continue button here
    loading.value = true;
    if (loading.value) {
      loading.value = false;
      isContinueButtonPressed.value = false;
      isSignInButtonPressed.value = true;
      appBarTitle.value = 'password_title'.tr;
    }
  }

  // void onSignInButtonPressed() {
  //   loading.value = true;
  //   if (isSignInButtonPressed.value) {
  //     Get.toNamed(RouteName.selectDevice);
  //     loginApi();
  //   }
  // }

  void onRememberMeChanged(bool? value) {
    rememberMe.value = value!;
  }

  void onGoogleSignInButtonPressed() {
    // Implement the logic for the Google Sign-In button here
  }

  void onSignInButtonWithProviderPressed() {
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
