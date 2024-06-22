import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/data/string_resource.dart';
import 'package:test_app/ui/screens/otp_vertification_screen/otp_verification_controller.dart';
import 'package:test_app/utils/extension.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text_form_filed.dart';

class OTPVerificationScreen extends GetWidget<OTPVerificationController> {
  const OTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: _appBarWidget(),
        bottomSheet: _bottomWidget(context: context),
      ),
    );
  }

  Widget _appBarWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white.withOpacity(0.6)),
            height: 50,
            padding: const EdgeInsets.all(4),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            StringResource.verification,
            style: TextStyle(color: Colors.white, fontSize: 25),
          )
        ],
      ),
    );
  }

  Widget _bottomWidget({required BuildContext context}) {
    return controller.isTimerRunning.build((timerLive) {
      return Form(
        key: controller.formKey,
        child: BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    StringResource.otpInfo,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "+91 ${controller.box.read("mobileNumber")}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Text(
                          StringResource.edit,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormFiled(
                    controller: controller.otpController,
                    width: MediaQuery.of(context).size.width / 2.3,
                    maxLength: 4,
                    validator: controller.validateOtp,
                    hintText: StringResource.otpDigit,
                    keyboardType: TextInputType.number,
                  ),
                  if (controller.start != 0.obs)
                    Obx(() {
                      return Text(
                          "00:${controller.start.toString().padLeft(2, '0')}");
                    }),
                  CustomButton(
                    buttonName: StringResource.resendOtp,
                    backgroundColor: !timerLive ? Colors.blue : Colors.white,
                    fourgroundColor: !timerLive ? Colors.white : Colors.blue,
                    onPressed: () {
                      controller.navigation(context: context, isResend: true);
                    },
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                  CustomButton(
                    buttonName: StringResource.verifyNo,
                    onPressed: () {
                      controller.navigation(context: context, isResend: false);
                    },
                    width: MediaQuery.of(context).size.width / 1.5,
                  )
                ].withSpaceBetween(height: 20),
              ),
            );
          },
        ),
      );
    });
  }
}
