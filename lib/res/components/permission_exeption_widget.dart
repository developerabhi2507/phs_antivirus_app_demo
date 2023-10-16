import 'package:antivirus_app_demo1/res/components/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors/app_color.dart';

class PermissionExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final Color textColor;
  const PermissionExceptionWidget(
      {super.key,
      required this.onPress,
      required this.title,
      this.textColor = AppColor.buttonFg4Dark});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('permission_denied_titile'.tr),
      content: Text('camera_permission'.tr),
      actions: <Widget>[
        CustomTextButton(title: title, onPress: onPress),
        CustomTextButton(title: title, onPress: onPress),
        // TextButton(
        //   child: Text('Open Settings'),
        //   onPressed: () {
        //     // Open the app settings for the user to enable the permission
        //     openAppSettings();
        //     Navigator.of(context).pop(); // Close the dialog
        //   },
        // ),
        // TextButton(
        //   child: Text('Close'),
        //   onPressed: () {
        //     Navigator.of(context).pop(); // Close the dialog
        //   },
        // ),
      ],
    );
  }
}
