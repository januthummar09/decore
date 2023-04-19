import 'package:decore/controller/price_list/price_list_controller.dart';
import 'package:get/get.dart';

class PriceBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<PriceController>(PriceController());
  }
}
