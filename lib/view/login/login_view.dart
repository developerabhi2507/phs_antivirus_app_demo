import 'package:antivirus_app_demo1/res/components/text_button_widget.dart';
import 'package:antivirus_app_demo1/view/login/widgets/create_an_account_widget.dart';
import 'package:antivirus_app_demo1/view/login/widgets/divider_or_widget.dart';
import 'package:antivirus_app_demo1/view/login/widgets/forgot_password_widget.dart';
import 'package:antivirus_app_demo1/view/login/widgets/input_email_widget.dart';
import 'package:antivirus_app_demo1/view/login/widgets/input_password_widget.dart';
import 'package:antivirus_app_demo1/view/login/widgets/remember_me_widget.dart';
import 'package:antivirus_app_demo1/view/login/widgets/request_one_time_pass_widget.dart';
import 'package:antivirus_app_demo1/view/login/widgets/sign_in_button_widget.dart';
import 'package:antivirus_app_demo1/view/login/widgets/sign_in_with_different_account_widget.dart';
import 'package:antivirus_app_demo1/view/login/widgets/sign_in_with_google_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools;

import '../../res/colors/app_color.dart';
import '../../res/components/elevated_container_widget.dart';
import '../../res/utils/theme_constants.dart';
import '../../view_models/controllers/login/login_view_model.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formkey = GlobalKey<FormState>();
  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: Text(
            loginViewModel.appBarTitle.value,
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
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(height: Get.height - (Get.height - 70)),
                        InputEmailWidget(),
                        SizedBox(height: Get.height - (Get.height - 14)),
                        if (loginViewModel.isButtonPressed.value)
                          Column(
                            children: [
                              InputPasswordWidget(),
                              SizedBox(height: Get.height - (Get.height - 20)),
                              const RememberMeWidget(),
                            ],
                          ),
                        SizedBox(height: Get.height - (Get.height - 20)),
                        SignInButtonWidget(),
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
                        //         loginViewModel.onContinueButtonPressed(),
                        //     style: Theme.of(context)
                        //         .elevatedButtonTheme
                        //         .style,
                        //     child: Text(loginViewModel.buttonText.value),
                        //   ),
                        // ),
                        SizedBox(height: Get.height - (Get.height - 28)),
                        DividerOrTextWidget(),
                        SizedBox(height: Get.height - (Get.height - 20)),
                        SignInWithGoogleButton(
                            width: Get.width - (Get.width - 300),
                            buttonColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColor.buttonBg1Dark
                                    : AppColor.buttonBg1Light,
                            title: 'sign_in_with_google'.tr,
                            onPress: () {
                              loginViewModel.onGoogleSignInButtonPressed();
                            }),
                        SizedBox(height: Get.height - (Get.height - 20)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextButton(
                                  title: 'sign_in_text_button'.tr,
                                  textAlignment: Alignment.centerLeft,
                                  textDecoration: TextDecoration.underline,
                                  onPress:
                                      loginViewModel.onSignInButtonPressed),
                              SizedBox(width: Get.width - (Get.width - 5)),
                              Text(
                                'sign_in_text'.tr,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height - (Get.height - 20)),
                        ForgotPasswordWidget(),
                        SizedBox(height: Get.height - (Get.height - 10)),
                        RequestOneTimepasswordWidget(),
                        SizedBox(height: Get.height - (Get.height - 10)),
                        CreateAnAccountWidget(),
                        SizedBox(height: Get.height - (Get.height - 10)),
                        SignInWithDifferentAccWidget(),
                        SizedBox(height: Get.height - (Get.height - 30)),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                        //         CustomTextButton(
                        //             title: 'sign_in_text_button'.tr,
                        //             onPress:
                        //                 loginViewModel.onSignInButtonPressed),
                        //         Text(
                        //           'sign_in_text'.tr,
                        //           style: Theme.of(context).textTheme.bodyLarge,
                        //         ),
                        //       ],
                        //     ),
                        //     // SizedBox(height: Get.height - (Get.height - 30)),
                        //     CustomTextButton(
                        //         title: 'forgot_username'.tr,
                        //         onPress: loginViewModel
                        //             .onForgotUsernameButtonPressed),
                        //     // SizedBox(height: Get.height - (Get.height - 12)),
                        //     CustomTextButton(
                        //         title: 'one_time_passwordButton'.tr,
                        //         onPress: loginViewModel
                        //             .onRequestOneTimePasswordButtonPressed),
                        //     // SizedBox(height: Get.height - (Get.height - 12)),
                        //     if (!loginViewModel.isButtonPressed.value)
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         mainAxisSize: MainAxisSize.min,
                        //         children: [
                        //           Text(
                        //             'new_user_text'.tr,
                        //             style:
                        //                 Theme.of(context).textTheme.bodyLarge,
                        //           ),
                        //           CustomTextButton(
                        //               title: 'create_account'.tr,
                        //               onPress: loginViewModel
                        //                   .onCreateAccountButtonPressed),
                        //         ],
                        //       ),
                        //     if (loginViewModel.isButtonPressed.value)
                        //       CustomTextButton(
                        //           title: 'different_account'.tr,
                        //           onPress:
                        //               loginViewModel.onSignInWithDifferentAcc)
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height - (Get.height - 60)),
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
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'privacy_policy5'.tr,
                                ),
                                _createGestureTextSpan('privacy_policy6'.tr,
                                    Theme.of(context).textTheme.displayMedium,
                                    () {
                                  devtools.log('tap on Privacy Policy');
                                }),
                                TextSpan(
                                  text: 'privacy_policy7'.tr,
                                ),
                                _createGestureTextSpan('privacy_policy8'.tr,
                                    Theme.of(context).textTheme.displayMedium,
                                    () {
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
