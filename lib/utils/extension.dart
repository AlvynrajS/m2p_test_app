import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension WidgetRxExtensions<T, R> on Rx<T> {
  ObxValue build(Widget Function(T) builder) {
    return ObxValue<Rx<T>>((Rx<T> value) {
      return builder(value.value);
    }, this);
  }
}

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0) SizedBox(width: width, height: height),
          this[i],
        ],
      ];
}