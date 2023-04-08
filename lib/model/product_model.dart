// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

// ProductList productListFromJson(String str) => ProductList.fromJson(json.decode(str));

// String productListToJson(ProductList data) => json.encode(data.toJson());

// class ProductList {
//   ProductList({
//     required this.data,
//     required this.status,
//   });
//
//   List<Product> data;
//   bool status;
//
//   factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
//         data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
//         status: json["status"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "status": status,
//       };
// }

class Product {
  Product({
    required this.id,
    required this.name,
    required this.hsn,
    required this.rate,
    required this.gst,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String hsn;
  int rate;
  int gst;
  int total;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        hsn: json["hsn"],
        rate: json["rate"],
        gst: json["gst"],
        total: json["total"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "hsn": hsn,
        "rate": rate,
        "gst": gst,
        "total": total,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
