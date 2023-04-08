import 'package:decore/controller/Otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../utils/constant.dart';
import '../utils/widget/primary_button.dart';

class OptScreen extends StatefulWidget {
  const OptScreen({Key? key}) : super(key: key);

  @override
  State<OptScreen> createState() => _OptScreenState();
}

final defaultPinTheme = PinTheme(
  width: 5.5.h,
  height: 5.5.h,
  textStyle: const TextStyle(fontSize: 22, color: primaryColor, fontFamily: 'M'),
  decoration: BoxDecoration(
    // border: Border.all(color: primaryColor, width: 1.0),
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: colorForShadow,
        blurRadius: 4.0,
        offset: const Offset(0.0, 0.0),
      ),
    ],
  ),
  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: primaryColor),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: white,
    border: Border.all(color: primaryColor, width: 1.0),
  ),
);

class _OptScreenState extends State<OptScreen> {
  OtpController controller = Get.find<OtpController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      // appBar: const PreferredSize(preferredSize: Size.fromHeight(56), child: MyAppBar()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                iconSize: 30,
                onPressed: () {
                  Get.back();
                },
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    "OTP verification",
                    style: blackMedium22,
                    textAlign: TextAlign.center,
                  ),
                  heightSpace40,
                  Text(
                    "Otp has benn sent to you on your mobile\nnumber please enter it below",
                    textAlign: TextAlign.center,
                    style: color94Medium14,
                  ),
                  heightSpace30,
                  Pinput(
                    controller: controller.pinController,
                    defaultPinTheme: defaultPinTheme,
                    length: 5,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    // validator: (s) {
                    //   return s == '22223' ? null : 'Pin is incorrect';
                    // },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => debugPrint(pin),
                  ),
                  heightSpace40,
                  PrimaryButton(
                    onTap: () {
                      controller.verify();
                    },
                    text: "Verify",
                  ),
                  heightSpace15,
                  Text(
                    "Resend",
                    style: primarySemiBold14,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
