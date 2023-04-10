import 'package:decore/controller/order/choose_product_controller.dart';
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
  ChooseProductController controller = Get.find<ChooseProductController>();

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
                          controller: controller.searchController,
                          cursorColor: primaryColor,
                          style: color94Medium16,
                          // textInputAction: TextInputAction.search,
                          onChanged: (value) {
                            controller.searchProduct(value);
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
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          var data = controller.products[index];
                          Get.toNamed(RoutesName.orderMeterScreen, arguments: {
                            'productName': data,
                          });
                        },
                        title: Text(controller.products[index].name),
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
