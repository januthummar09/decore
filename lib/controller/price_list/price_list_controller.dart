import 'package:decore/utils/api_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';
import '../../utils/constant.dart';
import '../../utils/routes/routes_name.dart';

class PriceController extends GetxController {
  List<Product> priceListData = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    priceList();
  }

  Future<void> priceList() async {
    var response = await API.shared.productData();

    if (response.isSuccess) {
      priceListData = response.data;
      debugPrint("response  Price------------->>$priceListData");

      update();
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
}
