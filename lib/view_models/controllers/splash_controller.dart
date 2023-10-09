import 'package:get/get.dart';

class SplashController extends GetxController {
  // final FetchProductDetailsUsecase _fetchProductDetailsUsecase;
//
  // SplashController(this._fetchProductDetailsUsecase);

  @override
  void onReady() {
    super.onReady();
    _fetchProductDetails();
  }

  _fetchProductDetails() async {
    // await _fetchProductDetailsUsecase.execute();
    await Future.delayed(const Duration(seconds: 5));
    Get.offNamed('fetchDetails');
  }
}
