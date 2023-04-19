import 'package:get/get.dart';

import '../../../controller/order/part_dispatch/part_dispatch_controller.dart';

class PartDispatchBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<PartDispatchController>(PartDispatchController());
  }
}
