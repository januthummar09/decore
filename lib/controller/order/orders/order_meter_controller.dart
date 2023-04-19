import 'package:decore/controller/order/orders/meter_and_roll_controller.dart';
import 'package:decore/model/product_model.dart';
import 'package:decore/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/add_model.dart';
import '../../../model/product_detail_model.dart';
import '../../../utils/api_handler.dart';
import '../../../utils/routes/routes_name.dart';

class OrderMeterController extends GetxController {
  Product product = Get.arguments['productName'];
  bool isFirstTime = Get.arguments['isFirstTime'] ?? false;

  TextEditingController meterController = TextEditingController();
  TextEditingController serialNumController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  ProductDetail? dropdownValue;

  List<ProductDetail> productDetail = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductDetail();
    meter();
  }

  getProductDetail() async {
    debugPrint("id---->>${product.id}");

    var response = await API.shared.getProductDetail(product.id);

    if (response.isSuccess) {
      productDetail = response.data;
      debugPrint("products details---------->>$productDetail");
      update();

      var a = productDetail.map((e) => e.serialNumber).toList();
      debugPrint("a------>>$a");

      var meter = productDetail.map((e) => e.meters).toList();
      debugPrint("meter------>>$meter");
    } else {
      Get.dialog(
        AlertDialog(
          title: Text(response.message ?? ''),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              onPressed: () {
                Get.toNamed(RoutesName.loginScreen);
              },
            ),
          ],
        ),
      );
    }
  }

  meter() {
    // for (var item in productDetail) {
    //   debugPrint("loop--->>${item.serialNumber}");
    // }
    ProductDetail? detail = dropdownValue;

    // debugPrint(' dropdownValue-->>${detail!.serialNumber}');

    if (detail != null) {
      double meter = double.parse(meterController.text);
      double productMeter = double.parse(detail.meters);
      debugPrint('Meter ==>$meter');
      debugPrint('productMeter ==>$productMeter');
      if (meter <= productMeter) {
        debugPrint('Validate success');

        debugPrint("Product :$product");

        if (isFirstTime) {
          AddModel addModel = AddModel(meter: meterController.text, productDetail: dropdownValue!, product: product);

          debugPrint("isFirstTime if :$isFirstTime");

          Get.offNamedUntil(
            RoutesName.meterAndRollScreen,
            ModalRoute.withName(RoutesName.homeScreen),
            arguments: {
              "productList": [addModel],
            },
          );
        } else {
          debugPrint("isFirstTime else :$isFirstTime");

          MeterAndRollController meterAndRollController = Get.find<MeterAndRollController>();

          List<AddModel> productDetails = meterAndRollController.productDetails;

          int? index;
          var arguments = Map<String, dynamic>.from(Get.arguments);
          if (arguments.keys.contains('index')) {
            index = arguments['index'];
          }

          AddModel addModel = AddModel(meter: meterController.text, productDetail: dropdownValue!, product: product);
          if (index == null) {
            productDetails.add(addModel);
          } else {
            productDetails[index] = addModel;
          }
          Get.until((route) => route.settings.name == RoutesName.meterAndRollScreen);
          meterAndRollController.update();
        }
      } else {
        debugPrint('Meter can not be grater than =>$productMeter');

        Get.dialog(
          AlertDialog(
            title: Text("Maximum limits of meter is ${detail.meters}"),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
      }
    } else {
      debugPrint('Please select serial number');
    }
    update();
  }

  getList() {
    var serialNumber = productDetail.map((e) => e.serialNumber).toList();
    // debugPrint("getList------------>>$b");

    return serialNumber;
  }

// editDataList() {
//   if (editData != null) {
//     meterController.text = editData.meter;
//     dropdownValue!.serialNumber != editData.productDetail.serialNumber;
//   }
// }

// addData(String meter, ProductDetail productDetail) {
//   addModelData = AddModel(meter: meter, productDetail: productDetail);
//
//   addModelList.value.add(addModelData);
//
//   debugPrint("List--------->>${addModelList.value}");
//
//   itemCount.value = addModelList.value.length;
//   debugPrint("length--------->>${itemCount.value}");
//
//   meterController.clear();
//   remarkController.clear();
//   serialNumController.clear();
// }

// meter() {
//   var meter = productDetail.map((e) => e.meters).toList();
//   debugPrint("------->>$meter");
//
//   return meter;
// }

// demo() {
//   String a = "12";
//
//   int b = 12;
//
//   double c = double.parse(a);
//
//   debugPrint("c--->>$c");
//
//   if (c == b || c <= b) {
//     debugPrint("yes");
//   } else {
//     debugPrint("No");
//   }
// }

//   for (var x in productDetail) {
//     debugPrint("loop--->>${x.serialNumber}");
//     debugPrint("drop--->>${dropdownValue!.serialNumber}");
//
//     //   if (x.serialNumber.toString() == dropdownValue!.serialNumber) {
//     //     debugPrint("number is found");
//     //     if (meterController.text == x.meters) {
//     //       debugPrint("success");
//     //
//     //       return true;
//     //     } else {
//     //       debugPrint("not success");
//     //       return false;
//     //     }
//     //     return true;
//     //   }
//     //   return false;
//   }
// }
}
