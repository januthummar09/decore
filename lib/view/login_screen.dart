import 'package:decore/controller/login_controller.dart';
import 'package:decore/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../utils/widget/decorate_container.dart';
import '../utils/widget/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());

  final RegExp mobileRegExp = RegExp(r'^[789]\d{9}$');
  static String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
  var regExp = RegExp(regexPattern);

  Widget textFild() {
    return TextFormField(
      controller: controller.phoneNumberController,
      style: color94Medium16,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter a Phone Number";
        } else if (value.length != 10) {
          return "Please Enter a minimun 10 digit";
        } else if (!regExp.hasMatch(value)) {
          return 'Enter Valid Phone Number';
        } else {
          return null;
        }
      },
      cursorColor: primaryColor,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        // focusColor: ,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        hintText: 'Enter your mobile number',
        hintStyle: color94Medium16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              height: 35.h,
              width: double.infinity,
              color: primaryColor,
              child: Image.asset(loginMain),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 320,
                  ).copyWith(top: 0),
                  child: Column(children: [
                    heightSpace20,
                    Text(
                      "Welcome to smart decor please \n login your account",
                      style: color94Medium16,
                      textAlign: TextAlign.center,
                    ),
                    heightSpace45,
                    Row(
                      children: [
                        Text(
                          "Mobile number",
                          style: blackMedium16,
                        ),
                      ],
                    ),
                    heightSpace10,
                    Stack(
                      children: [
                        DecorateContainer(
                          child: Container(
                            height: 43,
                          ),
                        ),
                        TextFormField(
                          controller: controller.phoneNumberController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter a Phone Number";
                            } else if (!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)) {
                              return "Please Enter a Valid Phone Number";
                            } else if (value.length != 10) {
                              return "Please Enter a minimun 10 digit";
                            }
                            return null;
                          },
                          style: color94Medium16,
                          cursorColor: primaryColor,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your mobile number',
                            hintStyle: color94Medium16,
                            contentPadding: const EdgeInsets.only(top: 10, left: 15, right: 5, bottom: -5),
                          ),
                        ),
                      ],
                    ),

                    // textFild(),
                    heightSpace10,
                    Row(
                      children: [
                        Text(
                          '*we  are sending OTP for verification',
                          style: primaryRegular14,
                        ),
                      ],
                    ),
                    heightSpace60,
                    PrimaryButton(
                      text: 'Login',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await controller.login();
                        } else {
                          showDialog(
                            context: context,
                            builder: (ctx) => const AlertDialog(
                              title: Text("Show Alert Dialog Box"),
                              content: Text("Your mobile number is not valid"),
                            ),
                          );
                        }
                      },
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(bool success, String message, LoginController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                if (success) {
                  debugPrint("success----------->>$success");
                }
              },
            ),
          ],
        );
      },
    );
  }
}
