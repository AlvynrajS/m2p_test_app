import 'package:get/get.dart';
import 'package:test_app/data/string_resource.dart';

class DynmaicFormController extends GetxController {
  RxList<RxBool> showDeatils = [false.obs, false.obs].obs;

  RxList<String> dropDownValue = [
    "${StringResource.agency} ${StringResource.details}",
    "${StringResource.agency} ${StringResource.user} ${StringResource.details}",
  ].obs;

  void dropDownChoosen({required int index}) {
    showDeatils[index].value = !showDeatils[index].value;
  }
}
