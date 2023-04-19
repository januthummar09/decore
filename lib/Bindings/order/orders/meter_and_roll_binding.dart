import 'package:get/get.dart';

import '../../../controller/order/orders/meter_and_roll_controller.dart';

class MeterAndRollBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<MeterAndRollController>(MeterAndRollController());
  }
}
