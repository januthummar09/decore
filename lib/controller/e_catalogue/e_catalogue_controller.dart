import 'package:decore/utils/api_handler.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/e_catalogue_model.dart';
import '../../utils/constant.dart';

class ECatalogueController extends GetxController {
  List<ECatalogueModel> items = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    eCatalogue();
  }

  eCatalogue() async {
    var result = await API.shared.catalogue();

    if (result.isSuccess) {
      items = result.data;
      update();
    } else {
      Get.dialog(
        AlertDialog(
          title: Text(result.message.toString()),
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
                Get.toNamed(
                  RoutesName.loginScreen,
                );
                // Get.offAll(
                //   RoutesName.loginScreen,
                // );
              },
            ),
          ],
        ),
      );
    }
  }
}
