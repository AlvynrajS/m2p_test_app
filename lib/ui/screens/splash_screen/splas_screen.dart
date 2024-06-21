import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/data/string_resource.dart';
import 'package:test_app/ui/screens/splash_screen/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.navigation.call();

    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        _text(content: StringResource.poweredby),
        _text(content: StringResource.finflux),
        _text(content: StringResource.versioon),
        const SizedBox(height: 30),
      ]),
    );
  }

  Widget _text({required String content}) {
    return Text(
      content,
      style: TextStyle(
        color: Colors.white.withOpacity(0.5),
      ),
    );
  }
}
