import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnerCodeController extends GetxController {
  final TextEditingController partnerCode = TextEditingController();

  @override
  void onClose() {
    partnerCode.dispose();
    super.onClose();
  }
}
