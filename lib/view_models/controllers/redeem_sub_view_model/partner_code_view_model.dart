import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnerCodeViewModel extends GetxController {
  final partnerCode = TextEditingController().obs;
  final partnerCodeFocusNode = FocusNode().obs;

  @override
  void onClose() {
    partnerCode.value.dispose();
    super.onClose();
  }
}
