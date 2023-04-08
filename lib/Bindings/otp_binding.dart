import 'package:decore/controller/Otp_controller.dart';
import 'package:get/get.dart';

class OtpBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<OtpController>(OtpController());
  }
}
