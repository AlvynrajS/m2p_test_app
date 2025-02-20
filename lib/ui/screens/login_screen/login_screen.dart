import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/data/string_resource.dart';
import 'package:test_app/ui/screens/login_screen/lognin_controller.dart';
import 'package:test_app/utils/extension.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text_form_filed.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: _bodyWidget(),
        bottomSheet: BottomSheet(
          onClosing: () {},
          builder: (context) {
            return _bottomWidget(context: context);
          },
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          _text(content: StringResource.hiThere),
          _text(content: StringResource.loginInfo)
        ],
      ),
    );
  }

  Widget _text({required String content}) {
    return Text(
      content,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }

  Widget _bottomWidget({required BuildContext context}) {
    return Form(
      key: controller.formKey,
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomTextFormFiled(
              controller: controller.mobileNoController,
              validator: controller.validateMobile,
              maxLength: 10,
              hintText: StringResource.registerMobileNo,
              keyboardType: TextInputType.phone,
            ),
            CustomButton(
                width: MediaQuery.of(context).size.width / 1.2,
                buttonName: StringResource.login,
                onPressed: () {
                  controller.navigation(context: context);
                })
          ].withSpaceBetween(height: 20),
        ),
      ),
    );
  }
}
