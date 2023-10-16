import 'package:antivirus_app_demo1/res/components/permission_exeption_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ProductKeyViewModel extends GetxController {
  final productKey = TextEditingController().obs;
  final productKeyFocusNode = FocusNode().obs;

  @override
  void onClose() {
    productKey.value.dispose();
    super.onClose();
  }

  void onScanBarcodeButtonPressed() async {
    if (await Permission.camera.request().isGranted) {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#FF0AA59D',
        'Cancel',
        true,
        ScanMode.DEFAULT,
      );

      if (barcodeScanRes.isNotEmpty && barcodeScanRes.length <= 25) {
        String formattedBarcode = '';
        for (int i = 0; i < barcodeScanRes.length; i += 5) {
          formattedBarcode += barcodeScanRes.substring(i, i + 5);
          if (i + 5 < barcodeScanRes.length) {
            formattedBarcode += '-';
          }
        }

        productKey.value.text = formattedBarcode;
      }
    } else {
      // Permission denied
      if (await Permission.camera.isPermanentlyDenied ||
          await Permission.camera.isDenied) {
        // Show a dialog to navigate to app settings
        PermissionExceptionWidget(
            onPress: () async {
              openAppSettings();
              Get.back();
            },
            title: 'permission_aloow'.tr);
        await openAppSettings();
      } else {
        // Show a SnackBar or other UI to inform the user
        // Write a screen for verify this barcode is usefull or not
      }
    }
  }
}

class ProductKeyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final maxLength = 25; // The maximum length of the product key
    final value = newValue.text.replaceAll('-', '').toUpperCase();
    final buffer = StringBuffer();
    var position = 0;

    for (var i = 0; i < value.length; i++) {
      if (position == maxLength) break; // Stop input after 25 characters
      buffer.write(value[i]);
      position++;

      if (position == 5 && i < maxLength - 1) {
        buffer.write('-'); // Add hyphen after every 5 characters
        position = 0; // Reset position for the next group of characters
      }
    }

    final newText = buffer.toString();
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
