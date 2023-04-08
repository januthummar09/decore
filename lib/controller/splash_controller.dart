import 'package:decore/utils/api_handler.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        String? token = StoreData.shared.getToken();
        debugPrint('Token =>$token');
        if (token == null) {
          return Get.offAllNamed(RoutesName.loginScreen);
        } else {
          API.shared.updateToken();
          return Get.offAllNamed(RoutesName.homeScreen);
        }
      },
    );
  }
}
