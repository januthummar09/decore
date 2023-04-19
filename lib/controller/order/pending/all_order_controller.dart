import 'package:decore/utils/api_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/pending_order.dart';
import '../../../utils/constant.dart';
import '../../../utils/routes/routes_name.dart';

class AllOrderController extends GetxController {
  List<PendingOrder> pendingOrder = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    debugPrint("----------------");

    allPendingOrder();
  }

  allPendingOrder() async {
    var response = await API.shared.pendingOrder();

    if (response.isSuccess) {
      pendingOrder = response.data;
      debugPrint("response123456---->>  ${pendingOrder.length}");
      update();

      var a = pendingOrder.map((e) => e.id).toList();
      debugPrint("id---->>  $a");
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
