import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetUtils {
  static snackBar({required String content, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}
