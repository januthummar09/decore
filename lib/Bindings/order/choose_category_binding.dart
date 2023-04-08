import 'package:get/get.dart';

import '../../controller/order/choose_category_controller.dart';

class ChooseCategoryBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<ChooseCategoryController>(ChooseCategoryController());
  }
}
