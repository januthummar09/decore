// import 'package:decore/model/product_detail_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../model/product_model.dart';
// import '../../utils/api_handler.dart';
// import '../../utils/constant.dart';
// import '../../utils/routes/routes_name.dart';
//
// class OrderDetailController extends GetxController {
//   // Product product = Get.arguments['product'];
//   // String meter = Get.arguments['meter'];
//   // ProductDetail productDetail = Get.arguments['SerialNum'];
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     createOrder();
//   }
//
//   createOrder() async {
//     var response = await API.shared.createOrder(product, productDetail, meter);
//
//     debugPrint("  CreateOrder  response------>> $response");
//     var data = response.data;
//     debugPrint("create order data------------->>$data");
//
//     var message = data['message'];
//     debugPrint("message------------>>$message");
//
//     if (response.isSuccess) {
//       Get.dialog(
//         AlertDialog(
//           title: Text(message.toString()),
//           actions: [
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: const TextStyle(),
//               ),
//               child: const Text(
//                 'OK',
//                 style: TextStyle(
//                   color: primaryColor,
//                 ),
//               ),
//               onPressed: () {
//                 Get.toNamed(RoutesName.homeScreen);
//               },
//             ),
//           ],
//         ),
//       );
//       //alertDialoge/
//     }
//   }
//
//   double doTotal() {
//     String userMeter = Get.arguments['meter'];
//
//     var meter = double.parse(userMeter);
//
//     debugPrint("user meter------>>$meter");
//
//     var rate = product.rate;
//     debugPrint("Rate------>>$rate");
//
//     var gst = product.gst;
//     debugPrint("gst------>>$gst");
//
//     double gstPercentage = gst / 100;
//
//     debugPrint("gstPercentage---->>$gstPercentage");
//
//     var amount = rate * meter;
//     debugPrint("amount----->>$amount");
//
//     var totalGst = amount * gstPercentage;
//     debugPrint("total gst----->>$totalGst");
//
//     var totalAmount = amount + totalGst;
//
//     debugPrint("totalAmount----->>$totalAmount");
//
//     return totalAmount;
//   }
// }
