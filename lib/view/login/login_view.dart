import 'package:antivirus_app_demo1/res/components/text_button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools;

import '../../res/colors/app_color.dart';
import '../../res/components/elevated_container_widget.dart';
import '../../res/components/round_button_widget.dart';
import '../../res/utils/theme_constants.dart';
import '../../res/utils/utils.dart';
import '../../view_models/controllers/login/login_view_model.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          final _formKey = GlobalKey<FormState>();
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                toolbarHeight: 100,
                title: Text(
                  controller.appBarTitle.value,
                ),
                titleTextStyle: Theme.of(context).textTheme.labelMedium,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedContainer(
                      child: Padding(
                        padding: ThemeConstants.mediumPadding,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: Get.height - (Get.height - 70)),
                              TextFormField(
                                controller: controller.emailController.value,
                                focusNode: controller.emailFocusNode.value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    Utils.snackBar('Email', 'Enter email');
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  Utils.fieldFocusChange(
                                      context,
                                      controller.emailFocusNode.value,
                                      controller.passwordFocusNode.value);
                                },
                                cursorColor: AppColor.cursor,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  labelText: 'username_label'.tr,
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  border: const UnderlineInputBorder(),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.border1),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.border1),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              if (controller.isButtonPressed.value)
                                TextFormField(
                                  controller:
                                      controller.passwordController.value,
                                  focusNode: controller.passwordFocusNode.value,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      Utils.snackBar(
                                          'Password', 'Enter password');
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    Utils.fieldFocusChange(
                                        context,
                                        controller.emailFocusNode.value,
                                        controller.passwordFocusNode.value);
                                  },
                                  cursorColor: AppColor.cursor,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    labelText: 'password_label'.tr,
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    border: const UnderlineInputBorder(),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.border1),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.border1),
                                    ),
                                  ),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              SizedBox(height: Get.height - (Get.height - 14)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Custom Circular Checkbox
                                  GestureDetector(
                                    onTap: () {
                                      devtools.log('remember me');
                                      controller.onRememberMeChanged(
                                          !controller.rememberMe.value);
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.blue,
                                          width: 2,
                                        ),
                                      ),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.rememberMe.value
                                              ? Colors.blue
                                              : Colors.transparent,
                                        ),
                                        child: controller.rememberMe.value
                                            ? const Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 16,
                                              )
                                            : const SizedBox(), // Show an empty SizedBox when not checked
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'remember_me'.tr,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                              Obx(
                                () => RoundButton(
                                    width: Get.width - (Get.width - 300),
                                    buttonColor: AppColor.buttonBg2Light,
                                    textColor: AppColor.buttonFg2Light,
                                    borderColor: AppColor.border2,
                                    title: 'sign_in_button'.tr,
                                    loading: controller.loading.value,
                                    onPress: () {
                                      if (_formKey.currentState!.validate()) {
                                        controller.loginApi();
                                        controller.onSignInButtonPressed();
                                      }
                                    }),
                              ),
                              // Container(
                              //   width: double.infinity,
                              //   height: Get.height - (Get.height - 50),
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: Get.width - (Get.width - 30)),
                              //   foregroundDecoration: BoxDecoration(
                              //       borderRadius:
                              //           ThemeConstants.defaultBorderRadius),
                              //   child: ElevatedButton(
                              //     onPressed: () =>
                              //         controller.onContinueButtonPressed(),
                              //     style: Theme.of(context)
                              //         .elevatedButtonTheme
                              //         .style,
                              //     child: Text(controller.buttonText.value),
                              //   ),
                              // ),
                              SizedBox(height: Get.height - (Get.height - 28)),
                              Row(
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      color: AppColor.divider,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: ThemeConstants.smallPadding,
                                    child: Text('divider_text'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      color: AppColor.divider,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Get.height - (Get.height - 25)),
                              // GoogleSignInButton(
                              //   onPressed:
                              //       controller.onGoogleSignInButtonPressed,
                              // ),
                              SizedBox(height: Get.height - (Get.height - 21)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomTextButton(
                                          title: 'sign_in_text_button'.tr,
                                          onPress:
                                              controller.onSignInButtonPressed),
                                      Text(
                                        'sign_in_text'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(height: Get.height - (Get.height - 30)),
                                  CustomTextButton(
                                      title: 'forgot_username'.tr,
                                      onPress: controller
                                          .onForgotUsernameButtonPressed),
                                  // SizedBox(height: Get.height - (Get.height - 12)),
                                  CustomTextButton(
                                      title: 'one_time_passwordButton'.tr,
                                      onPress: controller
                                          .onRequestOneTimePasswordButtonPressed),
                                  // SizedBox(height: Get.height - (Get.height - 12)),
                                  if (!controller.isButtonPressed.value)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'new_user_text'.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        CustomTextButton(
                                            title: 'create_account'.tr,
                                            onPress: controller
                                                .onCreateAccountButtonPressed),
                                      ],
                                    ),
                                  if (controller.isButtonPressed.value)
                                    CustomTextButton(
                                        title: 'different_account'.tr,
                                        onPress:
                                            controller.onSignInWithDifferentAcc)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height - (Get.height - 30)),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: ThemeConstants.mediumPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'privacy_policy5'.tr,
                                      ),
                                      _createGestureTextSpan(
                                          'privacy_policy6'.tr,
                                          Theme.of(context)
                                              .textTheme
                                              .displayMedium, () {
                                        devtools.log('tap on Privacy Policy');
                                      }),
                                      TextSpan(
                                        text: 'privacy_policy7'.tr,
                                      ),
                                      _createGestureTextSpan(
                                          'privacy_policy8'.tr,
                                          Theme.of(context)
                                              .textTheme
                                              .displayMedium, () {
                                        devtools.log('tap on Terms of Service');
                                      }),
                                      TextSpan(
                                        text: 'privacy_policy9'.tr,
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }

  TextSpan _createGestureTextSpan(
      String text, TextStyle? style, VoidCallback? onTap) {
    if (onTap != null) {
      return TextSpan(
        text: text,
        style: style,
        recognizer: TapGestureRecognizer()..onTap = onTap,
      );
    } else {
      return TextSpan(
        text: text,
        style:
            style ?? const TextStyle(), // Use a default style if style is null
      );
    }
  }
}
