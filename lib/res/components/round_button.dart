import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.buttonColor = AppColor.buttonBg1Light,
      this.textColor = AppColor.buttonFg1Light,
      this.borderColor = AppColor.border1,
      this.overlayColor = AppColor.buttonOverLayLight,
      required this.title,
      required this.onPress,
      this.isPressed = false,
      this.width = 60,
      this.height = 50,
      this.loading = false});

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final bool isPressed;
  final Color textColor, buttonColor, borderColor, overlayColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isPressed ? overlayColor : buttonColor,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: borderColor),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
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

// class RoundButton1 extends StatefulWidget {
//   const RoundButton1(
//       {super.key,
//       this.buttonColor = AppColor.buttonBg1Light,
//       this.textColor = AppColor.buttonFg1Light,
//       this.borderColor = AppColor.border1,
//       this.overlayColor = AppColor.buttonOverLayLight,
//       required this.title,
//       required this.onPress,
//       this.width = 60,
//       this.height = 50,
//       this.loading = false});

//   final bool loading;
//   final String title;
//   final double height, width;
//   final VoidCallback onPress;
//   final Color textColor, buttonColor, borderColor, overlayColor;

//   @override
//   State<RoundButton1> createState() => _RoundButton1State();
// }

// class _RoundButton1State extends State<RoundButton1> {
//   bool _isPressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) {
//         setState(() {
//           _isPressed = true;
//         });
//       },
//       onTapUp: (_) {
//         setState(() {
//           _isPressed = false;
//         });
//       },
//       onTapCancel: () {
//         setState(() {
//           _isPressed = false;
//         });
//       },
//       onTap: widget.onPress,
//       child: Container(
//         height: widget.height,
//         width: widget.width,
//         decoration: BoxDecoration(
//           color: _isPressed ? widget.overlayColor : widget.buttonColor,
//           borderRadius: BorderRadius.circular(40),
//           border: Border.all(color: widget.borderColor),
//         ),
//         child: widget.loading
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Center(
//                 child: Text(
//                   widget.title,
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleMedium!
//                       .copyWith(color: widget.textColor),
//                 ),
//               ),
//       ),
//     );
//   }
// }
