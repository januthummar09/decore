import 'package:decore/controller/e_catalogue/pdf_viewer_controller.dart';
import 'package:get/get.dart';

class PdfViewerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<PdfController>(PdfController());
  }
}
