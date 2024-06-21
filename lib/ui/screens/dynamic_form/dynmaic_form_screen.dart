import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/data/string_resource.dart';
import 'package:test_app/ui/screens/dynamic_form/dynamic_form_controller.dart';
import 'package:test_app/utils/extension.dart';
import 'package:test_app/widgets/custom_button.dart';

class DynamicFormScreen extends GetWidget<DynmaicFormController> {
  const DynamicFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(StringResource.dynamicForm),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: Colors.white.withOpacity(0.9)),
              height: MediaQuery.of(context).size.height / 1.25,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: ListView.separated(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.white),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        _dropDownTile(
                            dpIndex: index,
                            name: controller.dropDownValue[index],
                            onTap: () {
                              controller.dropDownChoosen(index: index);
                            }),
                        controller.showDeatils[index].build((showDetails) {
                          return showDetails
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.4),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 5),
                                        _dropDownDetail(
                                            leadingText: StringResource.agency +
                                                StringResource.type,
                                            trailingText: "DSA"),
                                        _divider(),
                                        _dropDownDetail(
                                            leadingText:
                                                "${StringResource.agency} ${StringResource.name}",
                                            trailingText: "A;win"),
                                        _divider(),
                                        _dropDownDetail(
                                            leadingText:
                                                StringResource.sourcedBy,
                                            trailingText: "Value"),
                                        _divider(),
                                        const SizedBox(height: 17),
                                        _divider(),
                                        const SizedBox(height: 12),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox();
                        })
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomButton(
        buttonNmae: "",
        onPressed: () {},
      ),
    );
  }

  Widget _errorWidget(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height / 1.121,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Icon(Icons.abc),
          const Text(
            StringResource.nothigIsHere,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          CustomButton(
              width: MediaQuery.of(context).size.width / 1.2,
              buttonNmae: StringResource.addData,
              onPressed: () {}),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _dropDownTile(
      {required String name, void Function()? onTap, required int dpIndex}) {
    return ListTile(
        onTap: onTap,
        tileColor: Colors.white,
        title: Text(name),
        trailing: controller.showDeatils[dpIndex].build((showDetails) {
          return Icon(showDetails
              ? Icons.keyboard_arrow_up_outlined
              : Icons.keyboard_arrow_down_rounded);
        }));
  }

  Widget _dropDownDetail(
      {required String leadingText, required String trailingText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leadingText),
          Text(trailingText),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      color: Colors.black,
    );
  }
}
