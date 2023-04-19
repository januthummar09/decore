import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  PageController? pageController;
  // PageController? pageController= PageController();

  int? selectedIndex = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController();
  }
}
