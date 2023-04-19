import 'package:get/get.dart';

import '../../../controller/order/orders/order_controller.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<OrderController>(OrderController());
  }
}
