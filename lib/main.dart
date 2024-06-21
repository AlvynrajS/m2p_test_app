import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/data/dependency/injector/injection.dart';
import 'routes/routes.dart';

void main() async {
  await inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}