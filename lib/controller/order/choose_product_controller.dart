import 'package:decore/model/product_model.dart';
import 'package:decore/utils/api_handler.dart';
import 'package:decore/utils/constant.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseProductController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<Product> products = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  getData() async {
    var response = await API.shared.productData();
    if (response.isSuccess) {
      products = response.data;
      debugPrint("products---------->>$products");
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

  void searchProduct(String query) {
    final suggestion = products.where((item) {
      final productTitle = item.name.toLowerCase();
      final input = query.toLowerCase();
      return productTitle.contains(input);
    }).toList();
    if (query.isNotEmpty) {
      products = suggestion;
      update();
    }
    // else {
    //   products = products;
    //   update();
    // }
  }
}
