import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_app/routes/routes.dart';
import 'package:test_app/ui/screens/login_screen/lognin_controller.dart';

class OTPVerificationController extends GetxController {
  LoginController loginController = Get.find();
  String mobileNo = "";
  RxInt start = 30.obs;
  RxBool isTimerRunning = false.obs;
  late Timer timer;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    mobileNo = loginController.mobileNoController.text;
    startTimer();
    super.onInit();
  }

  void startTimer() {
    isTimerRunning.value = true;
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (start.value == 0) {
        isTimerRunning.value = false;
        timer.cancel();
      } else {
        start.value--;
      }
    });
  }

  void pauseTimer() {
    isTimerRunning.value = false;
    timer.cancel();
  }

  void resetTimer() {
    isTimerRunning.value = false;
    start.value = 30;
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  String? validateOtp(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Please enter OTP';
      }
      RegExp fourDigitRegex = RegExp(r'^\d{4}$');
      if (!fourDigitRegex.hasMatch(value)) {
        return 'Please enter a valid OTP';
      }
      return null;
    } else {
      return null;
    }
  }

  void navigation({required BuildContext context, required bool isResend}) {
    if (isResend) {
      resetTimer();
      startTimer();
    } else {
      if (!formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please Enter valid OTP'),
          ),
        );
      } else {
        Get.offNamed(AppRoutes.dynamicFormScreen);
      }
    }
  }
}
