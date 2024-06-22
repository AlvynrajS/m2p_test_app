import 'package:flutter/material.dart';
import 'package:test_app/http/services.dart';
import 'package:test_app/models/access_token_model.dart';
import 'package:test_app/models/client_data_model.dart';
import 'package:test_app/models/get_from_data_model.dart';
import 'package:test_app/models/login_model.dart';
import 'package:test_app/utils/widget_utils.dart';

class Repo {
  static Future<String> loginCall(BuildContext context, String mobileNo) async {
    try {
      LoginModel? loginResult = await Services.login(mobileNo, context);
      if (loginResult != null) {
        var resourceId = loginResult.resourceIdentifier;
        // "b78ff270-1e19-43b7-a509-994f5a25c531";
        WidgetUtils.snackBar(
            content: "Successfully Logged In", context: context);
        return resourceId;
      } else {
        return "";
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
      return "";
    }
  }

  static Future<AccessTokenModel?> accessTokenCall(
      BuildContext context, Map<String, dynamic> requestBody) async {
    try {
      AccessTokenModel? accessTokenResult =
          await Services.accessToken(requestBody, context);
      if (accessTokenResult != null) {
        WidgetUtils.snackBar(
            content: "Successfully accessed by Token", context: context);
        return accessTokenResult;
      } else {
        return null;
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
      return null;
    }
  }

  static Future<ClientDataModel?> getClientDataCall(
      BuildContext context, Map<String, dynamic> requestBody) async {
    try {
      ClientDataModel? clientDataResult =
          await Services.getClientData(requestBody, context);
      if (clientDataResult != null) {
        WidgetUtils.snackBar(
            content: "Successfully Client Data loaded", context: context);
        return clientDataResult;
      } else {
        return null;
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
      return null;
    }
  }

  static Future<GetFromDataModel?> getFromDataCall({
    required BuildContext context,
    required Map<String, dynamic> requestBody,
  }) async {
    try {
      GetFromDataModel? getFromDataResult = await Services.getFromData(context);
      if (getFromDataResult != null) {
        WidgetUtils.snackBar(
            content: "Successfully Client Data loaded", context: context);
        return getFromDataResult;
      } else {
        return null;
      }
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
      return null;
    }
  }

  static Future<void> updateDataCall({
    required BuildContext context,
    required Map<String, dynamic> requestBody,
  }) async {
    try {
       await Services.updateFromData(context);
      WidgetUtils.snackBar(
          content: "Successfully Client Data updated", context: context);
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
    }
  }
}
