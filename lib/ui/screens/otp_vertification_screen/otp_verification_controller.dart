import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_app/http/repo.dart';
import 'package:test_app/models/access_token_model.dart';
import 'package:test_app/routes/routes.dart';
import 'package:test_app/utils/widget_utils.dart';

class OTPVerificationController extends GetxController {
  RxInt start = 30.obs;
  RxBool isTimerRunning = false.obs;
  late Timer timer;
  final formKey = GlobalKey<FormState>();
  final box = GetStorage();
  final TextEditingController otpController = TextEditingController();


  @override
  void onInit() {
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
      if (start.value == 0) {
        resetTimer();
        startTimer();
      }
    } else {
      if (!formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please Enter valid OTP'),
          ),
        );
      } else {
        //accessTokenCall(context);
        Get.offNamed(AppRoutes.dynamicFormScreen);
      }
    }
  }

  Future<void> accessTokenCall(BuildContext context) async {
    Map<String, dynamic> requestBody = {
      'client_id': 'community-app',
      'client_secret': '123',
      'grant_type': 'mobile_otp',
      'token': '123455',
      'username': box.read("mobileNumber"),
      'otp': otpController.text,
      'otpreferenceid': '1eca5cad-255a-4777-a198-0e06ec217840',
    };

    try {
      AccessTokenModel? token =
          await Repo.accessTokenCall(context, requestBody);
      if (token != null) {
        box.write("token", token);
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
    }
  }
}
