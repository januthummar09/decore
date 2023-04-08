import 'package:decore/controller/order/order_meter_controller.dart';
import 'package:get/get.dart';

class OrderMeterBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<OrderMeterController>(OrderMeterController());
  }
}
