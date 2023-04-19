import 'package:decore/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant.dart';

class ChooseCategoryPage extends StatelessWidget {
  const ChooseCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Meter & Roll ', style: whiteBold20),
      ),
      body: Column(
        children: [
          heightSpace20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    RoutesName.chooseProductScreen,
                    arguments: {'isFirstTime': false},
                  );
                },
                child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    // padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primaryColor),
                      boxShadow: [BoxShadow(blurRadius: 6, color: colorForShadow)],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(meter),
                        ),
                        Text(
                          'Meter',
                          style: blackMedium16,
                        ),
                      ],
                    )),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/SearchPage');
                },
                child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primaryColor),
                      boxShadow: [BoxShadow(blurRadius: 6, color: colorForShadow)],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(roll),
                        ),
                        const Text('Roll'),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
