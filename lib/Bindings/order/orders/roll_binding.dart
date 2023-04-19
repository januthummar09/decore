import 'package:get/get.dart';

class RollBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<RollBinding>(RollBinding());
  }
}
