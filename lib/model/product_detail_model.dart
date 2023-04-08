// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);

import 'dart:convert';

ProductDetail productDetailFromJson(String str) => ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());

class ProductDetail {
  ProductDetail({
    required this.id,
    required this.productId,
    required this.meters,
    required this.serialNumber,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  int productId;
  String meters;
  String serialNumber;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        productId: json["product_id"],
        meters: json["meters"],
        serialNumber: json["serial_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "meters": meters,
        "serial_number": serialNumber,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
