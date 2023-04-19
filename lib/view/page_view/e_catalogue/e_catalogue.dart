import 'package:cached_network_image/cached_network_image.dart';
import 'package:decore/controller/e_catalogue/e_catalogue_controller.dart';
import 'package:decore/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';

class ECatalogueScreen extends StatelessWidget {
  ECatalogueScreen({Key? key}) : super(key: key);

  final controller = Get.put<ECatalogueController>(ECatalogueController()); //<---

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GetBuilder(
            builder: (ECatalogueController controller) {
              return GridView.builder(
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemCount: controller.items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 14 / 9,
                ),
                itemBuilder: (context, index) {
                  // activeDeviceList[index]['switch'] == true ? active.add(index) : active.remove(index);
                  debugPrint("image------->>${controller.items[index].image}");
                  return GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/PdfViewerPage');
                      Get.toNamed(
                        RoutesName.pdfViewerScreen,
                        arguments: {
                          "pdf": controller.items[index].pdf,
                          "product_name": controller.items[index],
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primaryColor),
                        boxShadow: index == 0 ? null : [BoxShadow(blurRadius: 6, color: colorForShadow)],
                      ),
                      // child: Image.network(controller.items[index].image.toString()),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              child: controller.items[index].image != null
                                  ? CachedNetworkImage(
                                      imageUrl: controller.items[index].image!,
                                      fit: BoxFit.cover,
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(
                                        semanticsLabel: 'Circular progress indicator',
                                        color: primaryColor,
                                      ),
                                    ),

                              // Image.asset(
                              //         catalogue1,
                              //         fit: BoxFit.cover,
                              //       ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            child: Text(
                              controller.items[index].name,
                              style: blackMedium18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
