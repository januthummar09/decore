import 'package:decore/controller/order/order_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  OrderDetailController controller = Get.find<OrderDetailController>();

  // @override
  // void initState() {
  //   super.initState();
  //   debugPrint('adidas=>${controller.product}');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Order detail', style: whiteBold20),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Product Name :  ', style: blackMedium16),
                    Text(controller.product.name, style: color94Medium14),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Meter  :   ', style: blackMedium16),
                    Text(controller.meter.toString(), style: color94Medium14),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Serial Number :  ', style: blackMedium16),
                    Text(controller.productDetail.serialNumber.toString(), style: color94Medium14),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Total amount :  ', style: blackMedium16),
                    Text('200', style: color94Medium14),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
