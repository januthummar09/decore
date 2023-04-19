import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../controller/e_catalogue/pdf_viewer_controller.dart';
import '../../../utils/constant.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({Key? key}) : super(key: key);

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  final controller = Get.find<PdfController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(controller.item.name.toString()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: GetBuilder(
        builder: (PdfController controller) {
          debugPrint("pdf------>>${controller.pdf}");

          return controller.pdf.isEmpty
              ? const CircularProgressIndicator()
              : SfPdfViewer.network(
                  controller.pdf.toString(),
                  key: _pdfViewerKey,
                );
        },
      ),
    );
  }
}
