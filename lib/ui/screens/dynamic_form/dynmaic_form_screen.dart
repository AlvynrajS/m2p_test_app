
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/data/string_resource.dart';
import 'package:test_app/ui/screens/dynamic_form/dynamic_form_controller.dart';
import 'package:test_app/utils/extension.dart';
import 'package:test_app/utils/image_resources.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_dropdown_text_form_field.dart';
import 'package:test_app/widgets/custom_text_form_filed.dart';

class DynamicFormScreen extends GetWidget<DynamicFormController> {
  const DynamicFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Material(
          color: Colors.white.withOpacity(0.9),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  title: const Text(StringResource.dynamicForm),
                  backgroundColor: Colors.blue,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 120,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 110),
                  controller.dropDownValue.isEmpty
                      ? _errorWidget(context)
                      : controller.isEditButtonClicked.value
                          ? _agencyDetails(context)
                          : _editableData(context),
                  CustomButton(
                      buttonName: controller.dropDownValue.isEmpty
                          ? StringResource.addData
                          : controller.isEditButtonClicked.value == true
                              ? StringResource.save
                              : StringResource.edit,
                      onPressed: () {
                        if (controller.dropDownValue.isNotEmpty) {
                          controller.isEditButtonClicked.value = true;
                        }
                      },
                      width: MediaQuery.of(context).size.width / 1.1),
                  const SizedBox(height: 30)
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _errorWidget(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Colors.white,
        ),
        // height: MediaQuery.of(context).size.height / 1.121,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(ImageResource.emptyImage),
            const Text(
              StringResource.nothigIsHere,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _dropDownTile(
      {required String name, void Function()? onTap, required int dpIndex}) {
    return ListTile(
        onTap: onTap,
        tileColor: Colors.white,
        title: Text(name),
        trailing: controller.showDetails[dpIndex].build((showDetails) {
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

  Widget _editableData(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: Colors.white,
          ),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: ListView.separated(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    _dropDownTile(
                        dpIndex: index,
                        name: controller.dropDownValue[index],
                        onTap: () {
                          controller.dropDownChosen(index: index);
                        }),
                    controller.showDetails[index].build((showDetails) {
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
                                child: ListView.builder(
                                  itemBuilder: (context, childIndex) {
                                    var entry = index == 0
                                        ? controller.agencyDetails.entries
                                            .elementAt(childIndex)
                                        : controller.userDetails.entries
                                            .elementAt(childIndex);

                                    return Column(
                                      children: [
                                        _dropDownDetail(
                                          leadingText: entry.key,
                                          trailingText: entry.value.toString(),
                                        ),
                                        _divider()
                                      ],
                                    );
                                  },
                                  itemCount: index == 0
                                      ? controller.agencyDetails.entries.length
                                      : (controller.userDetails.entries.length -
                                          8),
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
              return const SizedBox(height: 20);
            },
          ),
        ),
      ),
    );
  }

  Widget _agencyDetails(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                title: Text(
                  "${StringResource.agency} ${StringResource.details}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomDropdownFormField(
                  options: controller.agencyType["possibleValues"],
                  value: controller.selectedAgencyType?.value,
                  hintText: "${StringResource.agency} ${StringResource.type}",
                  onChanged: (String? newValue) {
                    controller.selectedAgencyType = newValue?.obs;
                    controller.isAgencyUpdated = true.obs;
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomDropdownFormField(
                    options: controller.selectedAgencyType?.value == "DSA"
                        ? controller.agencyName["possibleValuesMap"]["value"]
                            ["DSA"]
                        : controller.agencyName["possibleValuesMap"]["value"]
                            ["Connector"],
                    value: controller.selectedAgencyName?.value,
                    hintText: "${StringResource.agency} ${StringResource.name}",
                    onChanged: (String? newValue) {
                      controller.selectedAgencyName = newValue?.obs;
                    },
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextFormFiled(
                  controller: TextEditingController(),
                  width: MediaQuery.of(context).size.width,
                  hintText: "${StringResource.sourcedBy} *",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextFormFiled(
                  controller: TextEditingController(),
                  width: MediaQuery.of(context).size.width,
                  hintText: "${StringResource.agency} ${StringResource.code} *",
                ),
              ),
            ].withSpaceBetween(height: 20),
          ),
        ),
      ),
    );
  }
}
