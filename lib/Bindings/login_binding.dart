import 'package:decore/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<LoginController>(LoginController());
  }
}
