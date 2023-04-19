import 'package:get/get.dart';

import '../../model/e_catalogue_model.dart';

class PdfController extends GetxController {
  String pdf = Get.arguments['pdf'];
  ECatalogueModel item = Get.arguments['product_name'];
}
