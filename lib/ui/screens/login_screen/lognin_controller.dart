import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_app/http/repo.dart';
import 'package:test_app/routes/routes.dart';
import 'package:test_app/utils/widget_utils.dart';

class LoginController extends GetxController {
  TextEditingController mobileNoController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final box = GetStorage();

  String? validateMobile(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Please enter mobile number';
      }
      RegExp mobileRegex = RegExp(r'^\+?1?\d{9,15}$');
      if (!mobileRegex.hasMatch(value)) {
        return 'Please enter a valid mobile number';
      }
      return null;
    } else {
      return null;
    }
  }

  void navigation({required BuildContext context}) {
    if (!formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter valid Mobile Number'),
        ),
      );
    } else {
      // login(context);
      box.write('mobileNumber', mobileNoController.text);
      Get.toNamed(AppRoutes.otpScreen);
    }
  }

  Future<void> login(BuildContext context) async {
    try {
      String id = await Repo.loginCall(context, mobileNoController.text);
      if (id != "") {
        box.write("resourceId", id);
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
    }
  }
}
