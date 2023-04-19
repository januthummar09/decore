import 'package:get/get.dart';

import '../../../controller/order/pending/all_order_controller.dart';

class AllOrderBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<AllOrderController>(AllOrderController());
  }
}
