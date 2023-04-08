import 'package:decore/utils/api_handler.dart';
import 'package:decore/utils/constant.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> login() async {
    var response = await API.shared.login(phoneNumberController.text);

    var data = response.data;

    debugPrint("message------------->>$data");
    String message = data['message'];
    if (response.isSuccess) {
      debugPrint("-------->>${response.isSuccess}");
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
                Get.back();
                Get.toNamed(RoutesName.otpScreen, arguments: {'mobileNumber': phoneNumberController.text});
              },
            ),
          ],
        ),
      );
      //alertDialoge/
      // -> Verify OTP
    } else {
      if (message != null) {
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
                  Get.back();
                },
              ),
            ],
          ),
        );
      } else {
        Get.dialog(
          AlertDialog(
            title: const Text('Something went wrong'),
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
      //check response ->message
      // if yes -> show dialoge with message
      //else show dialoge -> Something went wrong.
    }
  }

  dialog() async {
    return await Get.defaultDialog(
      title: const Text("message").toString(),
      actions: [
        TextButton(
          // style: TextButton.styleFrom(
          //
          // ),
          child: const Text('OK'),
          onPressed: () {
            //   if (success) {}
          },
        ),
      ],
    );
  }
}
