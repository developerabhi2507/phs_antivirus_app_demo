import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';

class FetchDetailsController extends GetxController {
  // final FetchProductDetailsUsecase _fetchProductDetailsUsecase;

  // FetchDetailsController(this._fetchProductDetailsUsecase);

  @override
  void onReady() {
    super.onReady();
    _fetchProductDetails();
  }

  _fetchProductDetails() async {
    // await _fetchProductDetailsUsecase.execute();
    await Future.delayed(
      // Running time of gif.
      const Duration(milliseconds: 1500),
      () {
        // Get.to(token == null ? const LoginUsingPassword() : const HomeScreen());
        Get.toNamed(RouteName.loginOptionsView);
      },
    );
  }
}
