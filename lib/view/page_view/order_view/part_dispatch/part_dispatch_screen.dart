import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../controller/order/pending/all_order_controller.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/widget/decorate_container.dart';

class PartDispatchScreen extends StatelessWidget {
  PartDispatchScreen({Key? key}) : super(key: key);

  final controller = Get.put<AllOrderController>(AllOrderController());
  // final controller = Get.find<AllOrderController>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Dispatch orders', style: whiteBold20),
        ),
        body: GetBuilder(
          builder: (AllOrderController controller) {
            return controller.pendingOrder.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.pendingOrder.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      var pendingOrder = controller.pendingOrder[index];
                      return DecorateContainer(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.pendingOrder[index].id.toString(), style: blackMedium18),
                            heightSpace15,
                            Text('Mattress', style: color94Medium16),
                            heightSpace2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.pendingOrder[index].createdAt.toString(), style: color94Medium14),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(.20), borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    pendingOrder.status,
                                    style: TextStyle(fontSize: 10.sp, color: Colors.blue, fontFamily: 'M'),
                                  ),
                                )
                              ],
                            ),
                            heightSpace15,
                            pendingOrder.status == 'Pending'
                                ? Center(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(color: Colors.blue.withOpacity(.20), borderRadius: BorderRadius.circular(10)),
                                      child: Text(
                                        pendingOrder.status,
                                        style: TextStyle(fontSize: 10.sp, color: Colors.blue, fontFamily: 'M'),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
