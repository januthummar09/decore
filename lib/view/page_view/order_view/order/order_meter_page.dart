import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/order/order_meter_controller.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/routes/routes_name.dart';

class OrderMeterPage extends StatefulWidget {
  const OrderMeterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderMeterPage> createState() => _OrderMeterPageState();
}

class _OrderMeterPageState extends State<OrderMeterPage> {
  OrderMeterController controller = Get.find<OrderMeterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Meter', style: whiteBold20),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          // Get.to(const OrderDetailPage());
          debugPrint('controller.product.name ==>${controller.product.name}');
          debugPrint('controller.meterController.text ==>${controller.meterController.text}');
          debugPrint('controller.dropdownValue ==>${controller.dropdownValue!.serialNumber}');

          // Get.toNamed(RoutesName.orderDetailScreen);

          Get.toNamed(
            RoutesName.orderDetailScreen,
            arguments: {
              "product": controller.product,
              "meter": controller.meterController.text,
              "SerialNum": controller.dropdownValue,
            },
          );
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              heightSpace20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(controller.product.name, style: primaryMedium20),
              ),
              TextField(
                onTap: () {
                  getList();
                },
                cursorColor: primaryColor,
                controller: controller.meterController,
                scrollPadding: EdgeInsets.zero,
                keyboardType: TextInputType.number,
                maxLength: 4,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                  enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                  labelText: 'Enter Meter',
                  counterText: '',
                  labelStyle: color94Regular14,
                ),
              ),
              // TextField(
              //   cursorColor: primaryColor,
              //   controller: controller.serialNumController,
              //   scrollPadding: EdgeInsets.zero,
              //   keyboardType: TextInputType.number,
              //   maxLength: 4,
              //   textInputAction: TextInputAction.next,
              //   decoration: InputDecoration(
              //     focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
              //     enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
              //     labelText: 'Enter Serial Number',
              //     counterText: '',
              //     labelStyle: color94Regular14,
              //   ),
              // ),

              GetBuilder<OrderMeterController>(
                builder: (controller) {
                  return DropdownButton(
                    underline: Container(
                      height: 1,
                      color: primaryColor,
                    ),
                    isExpanded: true,
                    hint: Text(
                      'Select Serial Number',
                      style: color94Regular14,
                    ),
                    value: controller.dropdownValue,
                    items: controller.productDetail.map((e) => DropdownMenuItem(value: e, child: Text(e.serialNumber.toString()))).toList(),
                    // items: List.generate(controller.productDetail.length, (index) => controller.productDetail.toString()).map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
                    onChanged: (value) {
                      setState(() {
                        controller.dropdownValue = value;
                      });
                    },
                  );
                },
              ),
              TextField(
                controller: controller.remarkController,
                scrollPadding: EdgeInsets.zero,
                cursorColor: primaryColor,

                // maxLines: 2,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                  labelText: 'Remark',
                  labelStyle: color94Regular14,
                ),
              ),
            ],
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
