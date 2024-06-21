import 'package:get/get.dart';
import 'package:test_app/routes/routes.dart';

class SplashController extends GetxController {
  void navigation() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(AppRoutes.loginScreen);
    });
  }
}
