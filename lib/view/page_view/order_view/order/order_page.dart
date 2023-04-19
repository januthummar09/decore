import 'package:decore/controller/order/orders/order_controller.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/constant.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());

    List allRoomTypeList = [
      {
        'image': allOrders,
        'title': 'Orders',
      },
      {
        'image': pending,
        'title': 'Pending',
      },
      {
        'image': dispatch,
        'title': 'Dispatch',
      },
      {
        'image': partDispatch2,
        'title': 'Part Dispatch',
      },
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
                onTap: () async {
                  // Get.to(allRoomTypeList[index]['navigate']);
                  // Get.to(allRoomTypeList[index]['navigation']);

                  switch (index) {
                    case 0:
                      debugPrint("Tap index ==>$index");

                      /// .then value is given in future
                      var value = await controller.popupDialog();

                      debugPrint("value--->>$value");

                      break;
                    case 1:
                      Get.toNamed(RoutesName.allOrderPendingScreen);
                      break;
                    case 2:
                      Get.toNamed(RoutesName.dispatchScreen);
                      break;

                    case 3:
                      Get.toNamed(RoutesName.partDispatchScreen);
                      break;
                    // Add cases for other indices
                    default:
                      break;
                  }
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

  // Widget _buildRow(String name, double score) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //     child: Column(
  //       children: <Widget>[
  //         SizedBox(height: 12),
  //         Container(height: 2, color: Colors.redAccent),
  //         SizedBox(height: 12),
  //         Row(
  //           children: <Widget>[
  //             Text(name),
  //             Spacer(),
  //             Container(
  //               decoration: BoxDecoration(color: Colors.yellow[900], borderRadius: BorderRadius.circular(20)),
  //               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
  //               child: Text('$score'),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
