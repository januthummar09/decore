import 'package:decore/model/product_model.dart';
import 'package:decore/utils/api_handler.dart';
import 'package:decore/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product_detail_model.dart';
import '../../utils/routes/routes_name.dart';

class OrderMeterController extends GetxController {
  Product product = Get.arguments['productName'];

  TextEditingController meterController = TextEditingController();
  TextEditingController serialNumController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  ProductDetail? dropdownValue;

  List<ProductDetail> productDetail = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getProductDetail();
    getList();
  }

  getProductDetail() async {
    debugPrint("id---->>${product.id}");

    var response = await API.shared.getProductDetail(product.id);

    if (response.isSuccess) {
      productDetail = response.data;
      debugPrint("products details---------->>$productDetail");
      update();

      var a = productDetail.map((e) => e.serialNumber).toList();
      debugPrint("a------>>$a");
    } else {
      Get.dialog(
        AlertDialog(
          title: Text(response.message ?? ''),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              onPressed: () {
                Get.toNamed(RoutesName.loginScreen);
              },
            ),
          ],
        ),
      );
    }
  }

  getList() {
    var b = productDetail.map((e) => e.serialNumber).toList();
    debugPrint("getList------------>>$b");

    return b;
  }
}
