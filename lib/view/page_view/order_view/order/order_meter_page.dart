import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/order/orders/order_meter_controller.dart';
import '../../../../utils/constant.dart';

class OrderMeterPage extends StatefulWidget {
  const OrderMeterPage({Key? key}) : super(key: key);

  @override
  State<OrderMeterPage> createState() => _OrderMeterPageState();
}

class _OrderMeterPageState extends State<OrderMeterPage> {
  final formKey = GlobalKey<FormState>();

  OrderMeterController controller = Get.find<OrderMeterController>();
  String? dropdownVal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Meter', style: whiteBold20),
      ),
      floatingActionButton: InkWell(
        onTap: () async {
          // Get.to(const OrderDetailPage());
          debugPrint('controller.product.name ==>${controller.product.name}');
          debugPrint('controller.meterController.text ==>${controller.meterController.text}');
          // debugPrint('controller.dropdownValue ==>${controller.dropdownValue!.serialNumber}');

          // Get.toNamed(RoutesName.orderDetailScreen);

          // var data = controller.meter();

          // debugPrint("data------->>$data");

          // Get.toNamed(
          //   RoutesName.orderDetailScreen,
          //   arguments: {
          //     "product": controller.product,
          //     "meter": controller.meterController.text,
          //     // "SerialNum": controller.serialController.text,
          //     "SerialNum": controller.dropdownValue,
          //   },
          // );

          if (formKey.currentState!.validate()) {
            controller.meter();
            // Get.offNamedUntil(
            //   RoutesName.homeScreen,
            //   ModalRoute.withName(RoutesName.meterAndRollScreen),
            // );
            // Get.toNamed(RoutesName.meterAndRollScreen);
            //

            // Get.offUntil(RoutesName.meterAndRollScreen);

            // Get.toNamed(RoutesName.meterAndRollScreen);
            // Timer(const Duration(milliseconds: 300), () => Get.delete<OrderMeterController>());
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Text(
            'Proceed',
            style: whiteBold16,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                heightSpace20,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(controller.product.name, style: primaryMedium20),
                ),
                TextFormField(
                  cursorColor: primaryColor,
                  autocorrect: true,
                  controller: controller.meterController,
                  scrollPadding: EdgeInsets.zero,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter a Meter";
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                    labelText: 'Enter Meter',
                    counterText: '',
                    labelStyle: color94Regular14,
                  ),
                ),
                GetBuilder(
                  builder: (OrderMeterController controller) {
                    return DropdownButtonFormField(
                      // underline: Container(
                      //   height: 1,
                      //   color: primaryColor,
                      // ),

                      isExpanded: true,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 1,
                          ),
                        ),
                      ),

                      validator: (value) {
                        if (value == null) {
                          return 'Serial Number is required';
                        }
                      },

                      hint: Text('Select Serial Number', style: color94Regular14),
                      value: controller.dropdownValue,

                      items: controller.productDetail
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.serialNumber.toString(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        controller.dropdownValue = value!;
                        controller.update();
                      },
                    );
                  },
                ),
                TextFormField(
                  controller: controller.remarkController,
                  scrollPadding: EdgeInsets.zero,
                  cursorColor: primaryColor,
                  autocorrect: true,
                  // maxLines: 2,
                  textInputAction: TextInputAction.done,

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter a Remark";
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                    labelText: 'Remark',
                    labelStyle: color94Regular14,
                  ),
                ),
                // Expanded(
                //   child: GetBuilder(
                //     builder: (OrderMeterController controller) {
                //       return controller.addModelList.value.isEmpty
                //           ? const Center(
                //               child: CircularProgressIndicator(
                //                 color: primaryColor,
                //               ),
                //             )
                //           : Obx(
                //               () => ListView.builder(
                //                 itemCount: controller.itemCount.value,
                //                 itemBuilder: (context, index) {
                //                   return DecorateContainer(
                //                     child: ExpansionTile(
                //                       title: Text(
                //                         'Name',
                //                         style: primaryMedium16,
                //                       ),
                //                       iconColor: primaryColor,
                //                       controlAffinity: ListTileControlAffinity.trailing,
                //                       children: <Widget>[
                //                         const Divider(
                //                           height: 0,
                //                           color: primaryColor,
                //                         ),
                //                         heightSpace15,
                //                         Align(
                //                           alignment: Alignment.centerLeft,
                //                           child: Text('Meter :${controller.addModelList.value[index].meter}', style: primaryRegular14),
                //                         ),
                //                         heightSpace15,
                //                         Align(
                //                           alignment: Alignment.centerLeft,
                //                           child: Text('Qty  :${controller.dropdownValue!.serialNumber}', style: primaryRegular14),
                //                         ),
                //                         heightSpace15,
                //                       ],
                //                     ),
                //                   );
                //                 },
                //               ),
                //             );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List getList() {
    var b = controller.productDetail.map((e) => e.serialNumber).toList();
    debugPrint("getList------------>>$b");

    return b;
  }
}
