import 'package:decore/model/product_detail_model.dart';
import 'package:decore/model/product_model.dart';

class AddModel {
  final String meter;
  final ProductDetail productDetail;
  final Product product;

  AddModel({
    required this.meter,
    required this.productDetail,
    required this.product,
  });
}
