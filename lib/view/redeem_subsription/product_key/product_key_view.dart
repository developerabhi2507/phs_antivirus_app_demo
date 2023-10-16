import 'package:antivirus_app_demo1/view/redeem_subsription/product_key/widgets/input_product_key_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/utils/theme_constants.dart';
import '../../../view_models/controllers/redeem_sub_view_model/product_key_view_model.dart';

class ProductKeyView extends StatelessWidget {
  const ProductKeyView({super.key});

  @override
  Widget build(BuildContext context) {
    final productKeyViewModel = Get.put(ProductKeyViewModel());

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: Get.height - (Get.height - 50)),
          padding: ThemeConstants.defaultPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'product_key_title'.tr,
                style: Theme.of(context).textTheme.labelSmall,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: Get.height - (Get.height - 42)),
              Text(
                'product_key_message'.tr,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: Get.height - (Get.height - 28)),
              SizedBox(
                height: Get.height - (Get.height - 50),
                child: Row(
                  children: [
                    Expanded(child: InputProductKeyWidget()),
                    IconButton(
                      onPressed: () =>
                          productKeyViewModel.onScanBarcodeButtonPressed(),
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height - (Get.height - 28),
              ),
              SizedBox(
                  width: double.infinity,
                  height: Get.height - (Get.height - 47),
                  child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {},
                      child: Text('verify_button'.tr))),
            ],
          ),
        ),
      ),
    );
  }
}
