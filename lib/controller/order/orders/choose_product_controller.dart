import 'package:decore/model/product_model.dart';
import 'package:decore/utils/api_handler.dart';
import 'package:decore/utils/constant.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseProductController extends GetxController {
  List<Product> foundProduct = [];

  bool isFirstTime = Get.arguments['isFirstTime'] ?? false;
  int? index;
  String? result;

  TextEditingController searchController = TextEditingController();
  List<Product> products = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();

    var arguments = Map<String, dynamic>.from(Get.arguments);
    if (arguments.keys.contains('index')) {
      index = arguments['index'];
    }
  }

  Future<void> getData() async {
    var response = await API.shared.productData();

    if (response.isSuccess) {
      products = response.data;
      debugPrint("products---------->>$products");
      foundProduct = products;

      // for (Map products in response) {
      //   products.add(Product.fromJson(products));
      // }
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

  runFilter(String enterString) {
    List<Product> result = [];

    if (enterString.isEmpty) {
      result = products;
      update();
    } else {
      result = products
          .where(
            (user) => user.name.toLowerCase().contains(
                  enterString.toLowerCase(),
                ),
          )
          .toList();
      update();
    }

    foundProduct = result;
  }
}
