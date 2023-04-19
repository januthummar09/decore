import 'package:decore/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';

class OrderController extends GetxController {
  Future<T?> popupDialog<T>() {
    return Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 16,
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          children: <Widget>[
            Center(
              child: Text(
                'Meter & Roll',
                style: blackMedium18,
              ),
            ),
            heightSpace20,

            Row(
              children: [
                Expanded(
                  child: popup(page: RoutesName.chooseProductScreen, meter),
                ),
                Expanded(
                  child: popup(page: RoutesName.rollScreen, roll),
                ),
              ],
            ),
            // InkWell(
            //     onTap: () {
            //       Get.to(const ChooseProductPage());
            //     },
            //     child: popup(
            //       'Meter',
            //       meter,
            //     )),
          ],
        ),
      ),
    );
  }

  Widget popup(String image, {String? page}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: ElevatedButton(
        onPressed: () {
          Get.back(result: "No Data");
          if (page != null) {
            Get.toNamed(
              page,
              arguments: {'isFirstTime': true},
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image(
            image: AssetImage(
              image,
            ),
            height: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
