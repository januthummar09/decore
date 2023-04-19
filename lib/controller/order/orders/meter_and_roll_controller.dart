import 'package:decore/model/add_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/api_handler.dart';
import '../../../utils/constant.dart';
import '../../../utils/routes/routes_name.dart';

class MeterAndRollController extends GetxController {
  List<AddModel> productDetails = Get.arguments['productList'];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // serialList();
  }

  Future<void> serialList() async {
    List<Map<String, dynamic>> productList = [];
    for (var item in productDetails) {
      Map<String, dynamic> productData = {
        "product_id": item.product.id,
        "meter": item.meter,
        "serial_number": item.productDetail.serialNumber,
      };

      productList.add(productData);
    }

    debugPrint("productList ------->>$productList");

    var response = await API.shared.createOrderList(productList);

    // debugPrint("created order response---------->>$response");

    var data = response.data;

    // debugPrint("data response---------->>$data");

    var message = data['message'];
    // debugPrint("message------------>>$message");

    if (response.isSuccess) {
      Get.dialog(
        AlertDialog(
          title: Text(message.toString()),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(),
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              onPressed: () {
                Get.toNamed(RoutesName.homeScreen);
              },
            ),
          ],
        ),
      );
    } else {
      Get.dialog(
        AlertDialog(
          title: Text(response.message.toString()),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(),
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      );
    }

    // var serialNum = productDetails.map((e) => e.productDetail.serialNumber).toList();
    //
    // debugPrint("serialNum ------->>$serialNum");
    // var meter = productDetails.map((e) => e.meter).toList();
    // debugPrint("meter ------->>$meter");
    //
    // var id = productDetails.map((e) => e.product.id).toList();
    //
    // debugPrint("id ------->>$id");
  }

  // getTotal() {
  //   double total;
  //   for (var item in productDetails) {
  //     debugPrint("rate----->>${item.product.rate}");
  //     debugPrint("meter----->>${item.meter}");
  //
  //     var meter = double.parse(item.meter);
  //
  //     debugPrint("user meter------>>$meter");
  //
  //     total = meter * item.product.rate;
  //
  //     debugPrint("total----->>$total");
  //
  //     return total;
  //   }
  // }
}
