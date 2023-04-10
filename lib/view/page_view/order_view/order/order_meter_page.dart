import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/order/order_meter_controller.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/routes/routes_name.dart';

class OrderMeterPage extends StatefulWidget {
  const OrderMeterPage({Key? key}) : super(key: key);

  @override
  State<OrderMeterPage> createState() => _OrderMeterPageState();
}

class _OrderMeterPageState extends State<OrderMeterPage> {
  OrderMeterController controller = Get.find<OrderMeterController>();

  TextEditingController a = TextEditingController();
  final List<Map<String, dynamic>> _roles = [
    {"name": "Super Admin", "desc": "Having full access rights", "role": 1},
    {"name": "Admin", "desc": "Having full access rights of a Organization", "role": 2},
    {"name": "Manager", "desc": "Having Magenent access rights of a Organization", "role": 3},
    {"name": "Technician", "desc": "Having Technician Support access rights", "role": 4},
    {"name": "Customer Support", "desc": "Having Customer Support access rights", "role": 5},
    {"name": "User", "desc": "Having End User access rights", "role": 6},
  ];
  // String _selectedValue = 'Option 1';

  // String selectedValue = 'Option 1';

  final List<String> _allItems = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
  ];
  List listUserType = [
    {'name': 'Individual', 'value': 'individual'},
    {'name': 'Company', 'value': 'company'}
  ];

  final TextEditingController _controller = TextEditingController();
  String? _selectedValue;

  final List<String> _menuItems = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];

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
          debugPrint('controller.dropdownValue ==>${controller.serialController.text}');

          // Get.toNamed(RoutesName.orderDetailScreen);

          // if(controller.meterController.text==controller.productDeta)

          Get.toNamed(
            RoutesName.orderDetailScreen,
            arguments: {
              "product": controller.product,
              "meter": controller.meterController.text,
              // "SerialNum": controller.serialController.text,
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

              // DropdownFormField<List<ProductDetail>>(
              //   onEmptyActionPressed: () async {},
              //   decoration: const InputDecoration(
              //     hintText: "Enter serial Number",
              //     suffixIcon: Icon(
              //       Icons.arrow_drop_down,
              //       color: primaryColor,
              //     ),
              //   ),
              //   onSaved: (dynamic str) {},
              //   onChanged: (dynamic str) {},
              //   validator: (dynamic str) {},
              // dropdownItemFn: (item, position, focused, selected, onTap) => ListTile(
              //   title: ,
              // ),),

              // Row(
              //   children: [
              //     Expanded(
              //       child: TextField(
              //         controller: _controller,
              //         decoration: const InputDecoration(
              //           labelText: 'Selected value',
              //         ),
              //       ),
              //     ),
              //     PopupMenuButton<String>(
              //       icon: const Icon(Icons.arrow_drop_down),
              //       onSelected: (String value) {
              //         setState(() {
              //           _selectedValue = value;
              //           _controller.text = _selectedValue!;
              //         });
              //       },
              //       itemBuilder: (BuildContext context) {
              //         return _menuItems.map((String value) {
              //           return PopupMenuItem<String>(
              //             value: value,
              //             child: Text(value),
              //           );
              //         }).toList();
              //       },
              //     ),
              //   ],
              // ),

              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      // controller: a,
                      controller: controller.serialController,
                      decoration: const InputDecoration(hintText: "Enter Serial Number"),
                    ),
                  ),
                  PopupMenuButton<dynamic>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: <ProductDetail>(value) {
                      debugPrint("val-------->>${value.serialNumber}");
                      setState(() {
                        controller.serialController.text = value.serialNumber;
                      });
                    },
                    itemBuilder: (BuildContext context) {
                      return controller.productDetail
                          .map(
                            (e) => PopupMenuItem(
                              value: e,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: colorForShadow,
                                      blurRadius: 3,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Text(
                                        e.serialNumber.toString(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text('maximum meter :${e.meters.toString()}'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList();
                    },
                  ),
                ],
              ),

              // GetBuilder<OrderMeterController>(
              //   builder: (controller) {
              //     return DropdownButton(
              //       underline: Container(
              //         height: 1,
              //         color: primaryColor,
              //       ),
              //       isExpanded: false,
              //       hint: Text(
              //         'Select Serial Number',
              //         style: color94Regular14,
              //       ),
              //       value: controller.dropdownValue,
              //       items: controller.productDetail
              //           .map(
              //             (e) => DropdownMenuItem(
              //               value: e.serialNumber,
              //               child: Container(
              //                 padding: const EdgeInsets.symmetric(
              //                   vertical: 5,
              //                 ),
              //                 // width: double.infinity,
              //                 decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: colorForShadow,
              //                       blurRadius: 3,
              //                       offset: const Offset(0, 0),
              //                     ),
              //                   ],
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.only(
              //                         left: 10,
              //                       ),
              //                       child: Text(
              //                         e.serialNumber.toString(),
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.symmetric(
              //                         horizontal: 10,
              //                       ),
              //                       child: Text('maximum meter :${e.meters.toString()}'),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           )
              //           .toList(),
              //       // items: List.generate(controller.productDetail.length, (index) => controller.productDetail.toString()).map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
              //       onChanged: <ProductDetail>(value) {
              //         setState(
              //           () {
              //             controller.dropdownValue = value;
              //           },
              //         );
              //       },
              //     );
              //   },
              // ),
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

  void choiceAction(String choice) {
    if (choice == Constants.FirstItem) {
      a.text = Constants.FirstItem;

      print('I First Item');
    } else if (choice == Constants.SecondItem) {
      a.text = Constants.SecondItem;

      print('I Second Item');
    } else if (choice == Constants.ThirdItem) {
      a.text = Constants.ThirdItem;

      print('I Third Item');
    }
  }

  void serialNum(String val) {}
}

// import 'package:dropdown_plus/dropdown_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../controller/order/order_meter_controller.dart';
//   const OrderMeterPage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<OrderMeterPage> createState() => _OrderMeterPageState();
// }
//
// class _OrderMeterPageState extends State<OrderMeterPage> {
//   OrderMeterController controller = Get.find<OrderMeterController>();
//   final List<Map<String, dynamic>> _roles = [
//     {"name": "Super Admin", "desc": "Having full access rights", "role": 1},
//     {"name": "Admin", "desc": "Having full access rights of a Organization", "role": 2},
//     {"name": "Manager", "desc": "Having Magenent access rights of a Organization", "role": 3},
//     {"name": "Technician", "desc": "Having Technician Support access rights", "role": 4},
//     {"name": "Customer Support", "desc": "Having Customer Support access rights", "role": 5},
//     {"name": "User", "desc": "Having End User access rights", "role": 6},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         title: Text('Meter', style: whiteBold20),
//       ),
//       floatingActionButton: InkWell(
//         onTap: () {
//           // Get.to(const OrderDetailPage());
//           debugPrint('controller.product.name ==>${controller.product.name}');
//           debugPrint('controller.meterController.text ==>${controller.meterController.text}');
//           debugPrint('controller.dropdownValue ==>${controller.dropdownValue!.serialNumber}');
//
//           // Get.toNamed(RoutesName.orderDetailScreen);
//
//           // if(controller.meterController.text==controller.productDeta)
//
//           // Get.toNamed(
//           //   RoutesName.orderDetailScreen,
//           //   arguments: {
//           //     "product": controller.product,
//           //     "meter": controller.meterController.text,
//           //     "SerialNum": controller.dropdownValue,
//           //   },
//           // );
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//           decoration: BoxDecoration(
//             color: primaryColor,
//             borderRadius: BorderRadius.circular(35),
//           ),
//           child: Text(
//             'Proceed',
//             style: whiteBold16,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 20,
//           ),
//           child: Column(
//             children: [
//               heightSpace20,
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(controller.product.name, style: primaryMedium20),
//               ),
//               TextField(
//                 onTap: () {
//                   getList();
//                 },
//                 cursorColor: primaryColor,
//                 controller: controller.meterController,
//                 scrollPadding: EdgeInsets.zero,
//                 keyboardType: TextInputType.number,
//                 maxLength: 4,
//                 textInputAction: TextInputAction.next,
//                 decoration: InputDecoration(
//                   focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
//                   enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
//                   labelText: 'Enter Meter',
//                   counterText: '',
//                   labelStyle: color94Regular14,
//                 ),
//               ),
//               // TextField(
//               //   cursorColor: primaryColor,
//               //   controller: controller.serialNumController,
//               //   scrollPadding: EdgeInsets.zero,
//               //   keyboardType: TextInputType.number,
//               //   maxLength: 4,
//               //   textInputAction: TextInputAction.next,
//               //   decoration: InputDecoration(
//               //     focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
//               //     enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
//               //     labelText: 'Enter Serial Number',
//               //     counterText: '',
//               //     labelStyle: color94Regular14,
//               //   ),
//               // ),
//
//               DropdownFormField<Map<String, dynamic>>(
//                 onEmptyActionPressed: () async {},
//                 decoration: InputDecoration(border: OutlineInputBorder(), suffixIcon: Icon(Icons.arrow_drop_down), labelText: "Access"),
//                 onSaved: (dynamic str) {},
//                 onChanged: (dynamic str) {},
//                 validator: (dynamic str) {},
//                 displayItemFn: (dynamic item) => Text(
//                   (item ?? {})['name'] ?? '',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 findFn: (dynamic str) async => _roles,
//                 selectedFn: (dynamic item1, dynamic item2) {
//                   if (item1 != null && item2 != null) {
//                     return item1['name'] == item2['name'];
//                   }
//                   return false;
//                 },
//                 filterFn: (dynamic item, str) => item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
//                 dropdownItemFn: (dynamic item, int position, bool focused, bool selected, Function() onTap) => ListTile(
//                   title: Text(item['name']),
//                   subtitle: Text(
//                     item['desc'] ?? '',
//                   ),
//                   tileColor: focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
//                   onTap: onTap,
//                 ),
//               ),
//
//               // GetBuilder<OrderMeterController>(
//               //   builder: (controller) {
//               //     return DropdownButton(
//               //       underline: Container(
//               //         height: 1,
//               //         color: primaryColor,
//               //       ),
//               //       isExpanded: true,
//               //       hint: Text(
//               //         'Select Serial Number',
//               //         style: color94Regular14,
//               //       ),
//               //       value: controller.dropdownValue,
//               //       items: controller.productDetail
//               //           .map(
//               //             (e) => DropdownMenuItem(
//               //               value: e,
//               //               child: Container(
//               //                 padding: const EdgeInsets.symmetric(
//               //                   vertical: 5,
//               //                 ),
//               //                 width: double.infinity,
//               //                 decoration: BoxDecoration(
//               //                   color: Colors.white,
//               //                   boxShadow: [
//               //                     BoxShadow(
//               //                       color: colorForShadow,
//               //                       blurRadius: 3,
//               //                       offset: const Offset(0, 0),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 child: Column(
//               //                   crossAxisAlignment: CrossAxisAlignment.start,
//               //                   children: [
//               //                     Padding(
//               //                       padding: const EdgeInsets.only(
//               //                         left: 10,
//               //                       ),
//               //                       child: Text(
//               //                         e.serialNumber.toString(),
//               //                       ),
//               //                     ),
//               //                     Padding(
//               //                       padding: const EdgeInsets.symmetric(
//               //                         horizontal: 10,
//               //                       ),
//               //                       child: Text('maximum meter :${e.meters.toString()}'),
//               //                     ),
//               //                   ],
//               //                 ),
//               //               ),
//               //             ),
//               //           )
//               //           .toList(),
//               //       // items: List.generate(controller.productDetail.length, (index) => controller.productDetail.toString()).map((e) => DropdownMenuItem(value: e, child: Text(e.toString()))).toList(),
//               //       onChanged: (value) {
//               //         setState(() {
//               //           controller.dropdownValue = value;
//               //         });
//               //       },
//               //     );
//               //   },
//               // ),
//               TextField(
//                 controller: controller.remarkController,
//                 scrollPadding: EdgeInsets.zero,
//                 cursorColor: primaryColor,
//
//                 // maxLines: 2,
//                 textInputAction: TextInputAction.done,
//                 decoration: InputDecoration(
//                   focusedBorder: const UnderlineInputBorder(
//                     borderSide: BorderSide(color: primaryColor),
//                   ),
//                   enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
//                   labelText: 'Remark',
//                   labelStyle: color94Regular14,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   List getList() {
//     var b = controller.productDetail.map((e) => e.serialNumber).toList();
//     debugPrint("getList------------>>$b");
//
//     return b;
//   }
// }

class Constants {
  static const String FirstItem = 'First Item';
  static const String SecondItem = 'Second Item';
  static const String ThirdItem = 'Third Item';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
  ];
}
