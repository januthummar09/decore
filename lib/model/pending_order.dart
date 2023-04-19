// To parse this JSON data, do
//
//     final pendingOrder = pendingOrderFromJson(jsonString);

import 'dart:convert';

PendingOrder pendingOrderFromJson(String str) => PendingOrder.fromJson(json.decode(str));

String pendingOrderToJson(PendingOrder data) => json.encode(data.toJson());

class PendingOrder {
  PendingOrder({
    required this.id,
    required this.userId,
    this.orderType,
    required this.remarks,
    this.comments,
    required this.status,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.items,
  });

  int id;
  int userId;
  dynamic orderType;
  String? remarks;
  dynamic comments;
  String status;
  String paymentStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<Item> items;

  factory PendingOrder.fromJson(Map<String, dynamic> json) => PendingOrder(
        id: json["id"],
        userId: json["user_id"],
        orderType: json["order_type"],
        remarks: json["remarks"],
        comments: json["comments"],
        status: json["status"],
        paymentStatus: json["payment_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_type": orderType,
        "remarks": remarks,
        "comments": comments,
        "status": status,
        "payment_status": paymentStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.id,
    required this.orderId,
    this.productId,
    this.meter,
    this.serialNo,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int orderId;
  dynamic productId;
  dynamic meter;
  dynamic serialNo;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        meter: json["meter"],
        serialNo: json["serial_no"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "meter": meter,
        "serial_no": serialNo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
