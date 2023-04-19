class ECatalogueModel {
  ECatalogueModel({
    required this.id,
    required this.name,
    required this.image,
    required this.pdf,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String? image;
  String pdf;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory ECatalogueModel.fromJson(Map<String, dynamic> json) {
    String? image = json["image"];
    String? pdf = json["pdf"];

    if (image != null) {
      image = image.replaceAll('mmdecor.test/', 'ec2-15-206-160-84.ap-south-1.compute.amazonaws.com/');
    }

    if (pdf != null) {
      pdf = pdf.replaceAll('mmdecor.test/', 'ec2-15-206-160-84.ap-south-1.compute.amazonaws.com/');
    }

    return ECatalogueModel(
      id: json["id"],
      name: json["name"],
      image: image,
      pdf: pdf.toString(),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      deletedAt: json["deleted_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "pdf": pdf,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
