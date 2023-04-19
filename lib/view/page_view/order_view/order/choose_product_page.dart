import 'package:decore/controller/order/orders/choose_product_controller.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant.dart';
import '../../../../utils/widget/decorate_container.dart';

class ChooseProductPage extends StatefulWidget {
  const ChooseProductPage({Key? key}) : super(key: key);

  @override
  State<ChooseProductPage> createState() => _ChooseProductPageState();
}

class _ChooseProductPageState extends State<ChooseProductPage> {
  ChooseProductController controller = Get.put(ChooseProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Products', style: whiteBold20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            DecorateContainer(
              child: Row(
                children: [
                  const Icon(Icons.search, color: color94),
                  widthSpace10,
                  Expanded(
                    child: GetBuilder(
                      builder: (ChooseProductController controller) {
                        return TextField(
                          onTap: () {},
                          controller: controller.searchController,
                          cursorColor: primaryColor,
                          style: color94Medium16,
                          textInputAction: TextInputAction.search,
                          onChanged: (value) async {
                            // controller.searchProduct(value);
                            controller.runFilter(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: color94Medium16,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetBuilder(
                builder: (ChooseProductController controller) {
                  debugPrint("foundProduct--->>${controller.foundProduct}");

                  return controller.products.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : ListView.builder(
                          // itemCount: controller.products.length,
                          itemCount: controller.foundProduct.length,

                          itemBuilder: (context, index) {
                            return ListTile(
                              key: ValueKey(controller.foundProduct[index].name),
                              onTap: () {
                                // var data = controller.products[index];
                                var data = controller.foundProduct[index];

                                var arguments = {
                                  'productName': data,
                                  'isFirstTime': controller.isFirstTime,
                                };
                                var changedIndex = controller.index;
                                if (changedIndex != null) {
                                  arguments['index'] = changedIndex;
                                }

                                Get.toNamed(
                                  RoutesName.orderMeterScreen,
                                  arguments: arguments,
                                );
                              },
                              // title: Text(controller.products[index].name),
                              title: Text(controller.foundProduct[index].name),
                              // subtitle: Text("'isFirstTime': ${controller.isFirstTime},"),
                            );
                          },
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
