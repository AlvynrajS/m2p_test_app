import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/data/string_resource.dart';
import 'package:test_app/ui/screens/otp_vertification_screen/otp_verification_controller.dart';
import 'package:test_app/utils/extension.dart';
import 'package:test_app/widgets/custom_button.dart';

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
                        controller.loginController.mobileNoController.text,
                        style: const TextStyle(
                          color: Colors.indigo,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        StringResource.edit,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      validator: controller.validateOtp,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        hintText: StringResource.otpDigit,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.blue)),
                      ),
                    ),
                  ),
                  Text(controller.start.toString()),
                  CustomButton(
                    buttonNmae: StringResource.resendOtp,
                    backgroundColor: !timerLive ? Colors.blue : Colors.white,
                    fourgroundColor: !timerLive ? Colors.white : Colors.blue,
                    onPressed: () {
                      controller.navigation(context: context, isResend: true);
                    },
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                  CustomButton(
                    buttonNmae: StringResource.verifyNo,
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
