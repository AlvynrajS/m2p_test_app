import 'package:get/get.dart';
import 'package:test_app/ui/screens/dynamic_form/dynamic_form_controller.dart';
import 'package:test_app/ui/screens/dynamic_form/dynmaic_form_screen.dart';
import 'package:test_app/ui/screens/login_screen/login_screen.dart';
import 'package:test_app/ui/screens/otp_vertification_screen/otp-verification_screen.dart';
import 'package:test_app/ui/screens/splash_screen/splas_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String loginScreen = '/login_screen';
  static const String otpScreen = '/otp_screen';
  static const String dynamicFormScreen = '/dynmaic_form_screen';

  static final routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: otpScreen, page: () =>  const OTPVerificationScreen()),
    GetPage(name: dynamicFormScreen, page: () => const DynamicFormScreen()),
  ];
}
