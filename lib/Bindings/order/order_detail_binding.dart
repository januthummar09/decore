import 'package:get/get.dart';

import '../../controller/order/order_detail_controller.dart';

class OrderDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<OrderDetailController>(OrderDetailController());
  }
}
