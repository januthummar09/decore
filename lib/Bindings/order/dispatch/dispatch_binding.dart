import 'package:get/get.dart';

import '../../../controller/order/dispatch/dispatch_controller.dart';

class DispatchBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<DispatchController>(DispatchController());
  }
}
