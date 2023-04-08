import 'dart:async';

import 'package:decore/utils/api_handler.dart';
import 'package:decore/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constant.dart';

class OtpController extends GetxController {
  String mobileNumber = Get.arguments['mobileNumber'];
  TextEditingController pinController = TextEditingController();

  verify() async {
    var response = await API.shared.otpVerify(mobileNumber, pinController.text);

    var data = response.data;
    debugPrint("otp data------------->>$data");

    var token = data['access_token'];
    StoreData.shared.setToken(token);
    API.shared.updateToken();

    debugPrint("token------------->>$token");

    if (response.isSuccess) {
      Get.dialog(
        AlertDialog(
          title: Column(
            children: const [
              CircularProgressIndicator(color: primaryColor),
              Text("Please wait"),
            ],
          ),
        ),
      );
      Timer(
        const Duration(seconds: 2),
        () {
          Get.to(
            const HomeScreen(),
          );
        },
      );

      // UiHelper.showLoadingDialog(context, 'Please wait');
    } else {
      Get.dialog(
        AlertDialog(
          title: Column(
            children: const [
              Text("your otp is  invalid"),
            ],
          ),
        ),
      );
    }
  }
}
