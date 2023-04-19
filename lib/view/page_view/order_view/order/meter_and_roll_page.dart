import 'package:decore/controller/order/orders/meter_and_roll_controller.dart';
import 'package:decore/model/add_model.dart';
import 'package:decore/utils/constant.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:decore/utils/widget/decorate_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeterAndRollPage extends StatefulWidget {
  const MeterAndRollPage({Key? key}) : super(key: key);

  @override
  State<MeterAndRollPage> createState() => _MeterAndRollPageState();
}

class _MeterAndRollPageState extends State<MeterAndRollPage> {
  MeterAndRollController controller = Get.find<MeterAndRollController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Products List', style: whiteBold20),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          controller.serialList();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Create Order',
            style: whiteBold16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: GetBuilder(
          builder: (MeterAndRollController controller) {
            return controller.productDetails.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.only(bottom: 150),
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.productDetails.length,
                        itemBuilder: (context, index) {
                          AddModel item = controller.productDetails[index];

                          var meter = double.parse(item.meter);
                          debugPrint("meter---->$meter");

                          return DecorateContainer(
                            child: ExpansionTile(
                              title: Text(
                                'Name :${item.product.name}',
                                style: primaryMedium16,
                              ),
                              iconColor: primaryColor,
                              controlAffinity: ListTileControlAffinity.trailing,
                              children: <Widget>[
                                Column(
                                  children: [
                                    const Divider(
                                      height: 0,
                                      color: primaryColor,
                                    ),
                                    heightSpace15,
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Meter   : ${item.meter}', style: primaryRegular14),
                                            ),
                                            heightSpace15,
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Serial Number   : ${item.productDetail.serialNumber}', style: primaryRegular14),
                                            ),
                                            heightSpace15,
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Total   :${meter * item.product.rate} ', style: primaryRegular14),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                // debugPrint("edit Data  ${controller.productDetails[index]}");
                                                dynamic editData = await Get.toNamed(
                                                  RoutesName.chooseProductScreen,
                                                  arguments: {
                                                    'isFirstTime': false,
                                                    'index': index,
                                                  },
                                                );

                                                if (editData != null) {
                                                  controller.productDetails[index] = editData;
                                                  controller.update();
                                                }
                                              },
                                              child: const Icon(
                                                Icons.edit,
                                                color: primaryColor,
                                              ),
                                            ),
                                            heightSpace15,
                                            InkWell(
                                              onTap: () {
                                                debugPrint("remove index------>>$index");
                                                controller.productDetails.removeAt(index);
                                                controller.update();
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    heightSpace15,
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(
                            RoutesName.chooseProductScreen,
                            arguments: {'isFirstTime': false},
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Add More Product",
                            style: primaryMedium16,
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
