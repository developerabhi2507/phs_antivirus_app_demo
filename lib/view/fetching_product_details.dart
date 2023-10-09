import 'package:antivirus_app_demo1/res/colors/app_color.dart';
import 'package:antivirus_app_demo1/view_models/controllers/fetch_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FetchProductDetailsScreen extends StatelessWidget {
  const FetchProductDetailsScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    final fetchDetails = Get.put(FetchDetailsController());
    return Scaffold(
        body: Center(
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),

        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        height: Get.height - (Get.height - 100),
        width: double.infinity,
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          color: Get.isDarkMode ? AppColor.bg3Dark : AppColor.bg3Light,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width - (Get.width - 30),
              ),
              // Loading Icon
              SizedBox(
                height: Get.height - (Get.height - 30),
                width: Get.width - (Get.width - 30),
                child: const CircularProgressIndicator(
                  strokeWidth: 5,
                  color: AppColor.circularIndicator,
                ),
              ),
              SizedBox(
                width: Get.width - (Get.width - 30),
              ),
              // Text Widget
              Flexible(
                child: Text('fetching_details'.tr,
                    style: Theme.of(context).textTheme.displaySmall),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
