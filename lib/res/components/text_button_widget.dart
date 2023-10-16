import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      this.textColor = AppColor.buttonFg4Dark,
      required this.title,
      required this.onPress,
      this.loading = false,
      this.textAlignment = Alignment.center});

  final bool loading;
  final String title;
  final VoidCallback onPress;
  final Color textColor;
  final Alignment textAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Align(
                alignment: textAlignment,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: textColor),
                ),
              ),
            ),
    );
  }
}
