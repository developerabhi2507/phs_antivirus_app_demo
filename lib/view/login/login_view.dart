import 'package:antivirus_app_demo1/view/login/widgets/continue_button_widget.dart';
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

import '../../res/components/elevated_container_widget.dart';
import '../../res/utils/theme_constants.dart';
import '../../view_models/controllers/login/login_view_model.dart';
import 'widgets/sign_in_with_service_provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formkey = GlobalKey<FormState>();
  final loginViewModel = Get.put(LoginViewModel());

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    loginViewModel.onContinueButtonPressed();
  }

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
                        SizedBox(height: Get.height - (Get.height - 90)),
                        InputEmailWidget(),
                        InputPasswordWidget(),
                        const RememberMeWidget(),
                        SizedBox(height: Get.height - (Get.height - 20)),
                        ContinueButtonWidget(
                          formKey: _formkey,
                        ),
                        SignInButtonWidget(
                          formKey: _formkey,
                        ),
                        DividerOrTextWidget(),
                        SizedBox(height: Get.height - (Get.height - 20)),
                        SignInWithGoogleButton(),
                        SizedBox(height: Get.height - (Get.height - 20)),
                        SignInWithServiceProviderWidget(),
                        SizedBox(height: Get.height - (Get.height - 20)),
                        ForgotPasswordWidget(),
                        SizedBox(height: Get.height - (Get.height - 10)),
                        RequestOneTimepasswordWidget(),
                        SizedBox(height: Get.height - (Get.height - 10)),
                        CreateAnAccountWidget(),
                        SizedBox(height: Get.height - (Get.height - 10)),
                        SignInWithDifferentAccWidget(),
                        SizedBox(height: Get.height - (Get.height - 30)),
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
