import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:test_app/http/constants.dart';
import 'package:test_app/http/http_service.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/models/access_token_model.dart';
import 'package:test_app/models/client_data_model.dart';
import 'package:test_app/models/get_from_data_model.dart';
import 'package:test_app/models/login_model.dart';
import 'package:test_app/utils/widget_utils.dart';

class Services {
  static Future<LoginModel?> login(String mobilNo, BuildContext context) async {
    try {
      Map<String, String> requestBody = {'mobileNumber': mobilNo};

      String requestBodyJson = jsonEncode(requestBody);

      var response = await http.post(
        Uri.parse(APIConstants.loginUrl),
        headers: HttpService.loginHeaders,
        body: requestBodyJson,
      );
      if (response.body.isNotEmpty) {
        var responseData = jsonDecode(response.body);

        return LoginModel.fromJson(responseData);
      } else {
        return null;
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
    }
    return null;
  }

  static Future<AccessTokenModel?> accessToken(
      Map<String, dynamic> requestBody, BuildContext context) async {
    try {
      String requestBodyJson = jsonEncode(requestBody);
      var response = await http.post(
        Uri.parse(APIConstants.accessToken),
        headers: HttpService.headers,
        body: requestBodyJson,
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return AccessTokenModel.fromJson(responseData);
      } else {
        return null;
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
    }
    return null;
  }

  static Future<ClientDataModel?> getClientData(
      Map<String, dynamic> requestBody, BuildContext context) async {
    try {
      String requestBodyJson = jsonEncode(requestBody);
      var response = await http.post(
        Uri.parse(APIConstants.getClientData),
        headers: HttpService.headers,
        body: requestBodyJson,
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return ClientDataModel.fromJson(responseData);
      } else {
        return null;
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
    }
    return null;
  }

  static Future<GetFromDataModel?> getFromData(BuildContext context) async {
    try {
      var response = await http.get(
        Uri.parse(APIConstants.getFormData),
        headers: HttpService.headers,
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return GetFromDataModel.fromJson(responseData);
      } else {
        return null;
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
    }
    return null;
  }

  static Future<void> updateFromData(BuildContext context) async {
    try {
      var response = await http.get(
        Uri.parse(APIConstants.updateFormData),
        headers: HttpService.headers,
      );
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        WidgetUtils.snackBar(
            content: " SuccessFully Updated ", context: context);
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
    }
  }
}
