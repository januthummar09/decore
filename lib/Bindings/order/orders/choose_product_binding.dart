import 'package:get/get.dart';

import '../../../controller/order/orders/choose_product_controller.dart';

class ChooseProductBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ChooseProductController>(ChooseProductController());
  }
}
