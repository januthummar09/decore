import 'package:decore/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../utils/constant.dart';
import 'page_view/e_catalogue/e_catalogue.dart';
import 'page_view/order_view/order/order_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Set active = {};
  // HomeController controller = Get.find<HomeController>();
  final controller = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    List choiceChip = ['Orders', 'E Catalogue', 'Price List'];

    return Scaffold(
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  // padding: const EdgeInsets.fromLTRB(20, 55, 20, 10),
                  height: 18.h, //pixel 3a

                  color: primaryColor,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('MM Decor', style: whiteBold20),
                      heightSpace15,
                      Row(
                        children: choiceChip
                            .map(
                              (e) => InkWell(
                                onTap: () {
                                  choiceChip.indexOf(e) == 0
                                      ? controller.pageController.animateToPage(
                                          0,
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                        )
                                      : choiceChip.indexOf(e) == 1
                                          ? controller.pageController.animateToPage(
                                              1,
                                              duration: const Duration(milliseconds: 500),
                                              curve: Curves.fastLinearToSlowEaseIn,
                                            )
                                          : controller.pageController.animateToPage(
                                              2,
                                              duration: const Duration(milliseconds: 500),
                                              curve: Curves.fastLinearToSlowEaseIn,
                                            );
                                  setState(() {
                                    controller.selectedIndex = choiceChip.indexOf(e);
                                  });
                                },
                                child: AnimatedContainer(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: controller.selectedIndex == choiceChip.indexOf(e) ? white : const Color(0xffD8D8D8).withOpacity(.50),
                                  ),
                                  duration: const Duration(microseconds: 200),
                                  child: Text(e, style: controller.selectedIndex == choiceChip.indexOf(e) ? primarySemiBold16 : color17SemiBold16),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (value) {
                  setState(() {
                    value == 0
                        ? controller.selectedIndex = 0
                        : value == 1
                            ? controller.selectedIndex = 1
                            : controller.selectedIndex = 2;

                    // debugPrint("Selection Index------->>$value");
                  });
                },
                children: const [
                  OrderPage(),
                  ECatalogue(),
                  Text("data 3"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
