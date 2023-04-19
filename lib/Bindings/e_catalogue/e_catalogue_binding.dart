import 'package:get/get.dart';

import '../../controller/e_catalogue/e_catalogue_controller.dart';

class ECatalogueBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<ECatalogueController>(ECatalogueController());
  }
}
