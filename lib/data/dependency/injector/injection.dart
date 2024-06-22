import 'package:get/get.dart';
import 'package:test_app/ui/screens/dynamic_form/dynamic_form_controller.dart';
import 'package:test_app/ui/screens/login_screen/lognin_controller.dart';
import 'package:test_app/ui/screens/otp_vertification_screen/otp_verification_controller.dart';
import 'package:test_app/ui/screens/splash_screen/splash_controller.dart';

Future inject() async {
  Get.create(() => SplashController(), permanent: true);
  Get.create(() => LoginController(), permanent: true);
  Get.create(() => OTPVerificationController(), permanent: true);
  Get.create(() => DynamicFormController(), permanent: true);
}
