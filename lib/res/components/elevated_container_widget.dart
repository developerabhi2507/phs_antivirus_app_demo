import 'package:flutter/material.dart';

import '../colors/app_color.dart';
import '../utils/theme_constants.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget child;

  const ElevatedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: ThemeConstants.defaultmargin,
      // padding: ThemeConstants.mediumPadding,
      decoration: BoxDecoration(
          borderRadius: ThemeConstants.largeBorderRadius,
          boxShadow: const [ThemeConstants.boxShadow],
          color: AppColor.bg3Light),
      child: child,
    );
  }
}
