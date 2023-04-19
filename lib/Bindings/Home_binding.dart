import 'package:decore/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeController>(HomeController());
    debugPrint("-------_------------homeBinding");
  }
}
