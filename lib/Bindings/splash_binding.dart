import 'package:decore/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SplashController>(SplashController());
  }
}
