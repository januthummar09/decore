import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/constant.dart';
import 'choose_category_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List allRoomTypeList = [
      {
        'image': allOrders,
        'title': 'Orders',
        // 'navigate': '/AllOrdersPage',
        'navigate': const ChooseCategoryPage(),
      },
      {
        'image': pending,
        'title': 'Pending',
        'navigate': const ChooseCategoryPage(),
      },
      {
        'image': dispatch,
        'title': 'Dispatch',
        'navigate': const ChooseCategoryPage(),
      },
      {
        'image': partDispatch2,
        'title': 'Part Dispatch',
        'navigate': const ChooseCategoryPage(),
      },
      // {
      //   'image': reports,
      //   'title': 'Reports',
      // },
      // {
      //   'image': rates,
      //   'title': 'Rates',
      // },
    ];

    return Column(
      children: [
        heightSpace10,
        Expanded(
          child: GridView.builder(
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.all(10),
            itemCount: allRoomTypeList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 14 / 9,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(allRoomTypeList[index]['navigate']);
                  // Get.to(allRoomTypeList[index]['navigation']);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: primaryColor),
                    boxShadow: [BoxShadow(blurRadius: 6, color: colorForShadow)],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 10.w,
                        child: Image.asset(allRoomTypeList[index]['image']),
                      ),
                      // heightSpace15,
                      Column(
                        children: [
                          Text(allRoomTypeList[index]['title'], style: primaryMedium16),
                          // Text(allRoomTypeList[index]['subtitle'],
                          //     style: color94Medium14),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
