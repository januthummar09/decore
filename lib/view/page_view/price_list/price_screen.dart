import 'package:decore/controller/price_list/price_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';

class PriceScreen extends StatelessWidget {
  PriceScreen({Key? key}) : super(key: key);

  // final controller = Get.find<PriceController>();

  final controller = Get.put<PriceController>(PriceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: Text('Product', style: blackBold16)),
              Expanded(child: Text('HSN', style: blackBold16)),
              widthSpace20,
              Expanded(child: Text('Rate', style: blackBold16)),
              Expanded(child: Text('GST', style: blackBold16)),
              Expanded(child: Text('With GST', style: blackBold16)),
            ],
          ),
          const Divider(
            thickness: 1,
            color: primaryColor,
          ),
          heightSpace20,
          ListView.separated(
            shrinkWrap: true,
            itemCount: controller.priceListData.length,
            separatorBuilder: (context, index) => heightSpace10,
            itemBuilder: (context, index) {
              var data = controller.priceListData[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: Text(data.name.toString(), style: blackRegular16)),
                  Expanded(child: Text(data.hsn.toString(), style: blackRegular16)),
                  widthSpace20,
                  Expanded(child: Text(data.rate.toString(), style: blackRegular16)),
                  Expanded(child: Text(data.gst.toString(), style: blackRegular16)),
                  Expanded(child: Text('118', style: blackRegular16)),
                ],
              );
            },
          ),
        ],
      ),

      // body: ListView(
      //   children: [_createDataTable()],
      // ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('product')),
      DataColumn(label: Text('hsn')),
      DataColumn(label: Text('rate')),
      DataColumn(label: Text('gst')),
      DataColumn(label: Text('withGst')),
    ];
  }

  List<DataRow> _createRows() {
    return [
      DataRow(
        cells: [
          DataCell(Text('#100')),
          DataCell(Text('Flutter Bafvgvgbbvgfbgbcgbgbhnsics')),
          DataCell(Text('David John')),
          DataCell(Text('Flutter Bafvgvgbbvgfbgbcgbgbhnsics')),
          DataCell(Text('David John')),
        ],
      ),
      DataRow(
        cells: [
          DataCell(Text('#101')),
          DataCell(Text('Dart Internals')),
          DataCell(Text('Alex Wick')),
          DataCell(Text('Flutter Bafvgvgbbvgfbgbcgbgbhnsics')),
          DataCell(Text('David John')),
        ],
      ),
      DataRow(
        cells: [
          DataCell(Text('#101')),
          DataCell(Text('Dart Internals')),
          DataCell(Text('Alex Wick')),
          DataCell(Text('Flutter Bafvgvgbbvgfbgbcgbgbhnsics')),
          DataCell(Text('David John')),
        ],
      ),
      DataRow(
        cells: [
          DataCell(Text('#101')),
          DataCell(Text('Dart Internals')),
          DataCell(Text('Alex Wick')),
          DataCell(Text('Flutter Bafvgvgbbvgfbgbcgbgbhnsics')),
          DataCell(Text('David John')),
        ],
      ),
      DataRow(
        cells: [
          DataCell(Text('#101')),
          DataCell(Text('Dart Internals')),
          DataCell(Text('Alex Wick')),
          DataCell(Text('Flutter Bafvgvgbbvgfbgbcgbgbhnsics')),
          DataCell(Text('David John')),
        ],
      )
    ];
  }
}
