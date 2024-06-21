import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/http/constants.dart';
import 'package:test_app/http/http_service.dart';
import 'package:test_app/routes/routes.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/utils/widget_utils.dart';

class LoginController extends GetxController {
  TextEditingController mobileNoController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
      Get.toNamed(AppRoutes.otpScreen);
    }
  }

  void login(BuildContext context) async {
    Map<String, String> requestBody = {'mobileNumber': mobileNoController.text};

    String requestBodyJson = jsonEncode(requestBody);

    try {
      var response = await http.post(
        Uri.parse(APIConstants.loginUrl),
        headers: HttpService.headers,
        body: requestBodyJson,
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);

        WidgetUtils.snackBar(
            content: "Successfully Logged In", context: context);
      } else {
        WidgetUtils.snackBar(
            content: " Error : ${response.statusCode}", context: context);
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
    }
  }


}
