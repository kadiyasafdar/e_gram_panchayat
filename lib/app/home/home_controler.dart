import 'package:get/get.dart';

class HomeControler extends GetxController {
  var selectedType = 'Cash'.obs;

  void changeType(String type) {
    selectedType.value = type;
  }
}
