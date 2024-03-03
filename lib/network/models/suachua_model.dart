import 'dart:convert';

XeSuaChua xeSuaChuaFromJson(String str) => XeSuaChua.fromJson(json.decode(str));

String xeSuaChuaToJson(XeSuaChua data) => json.encode(data.toJson());

class XeSuaChua {
  Data? data;
  dynamic errors;
  bool? success;

  XeSuaChua({
    this.data,
    this.errors,
    this.success,
  });

  factory XeSuaChua.fromJson(Map<String, dynamic> json) => XeSuaChua(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        errors: json["errors"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "errors": errors,
        "success": success,
      };
}

class Data {
  List<Datum>? data;
  int? page;
  int? size;
  int? total;

  Data({
    this.data,
    this.page,
    this.size,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        page: json["page"],
        size: json["size"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "page": page,
        "size": size,
        "total": total,
      };
}

class Datum {
  int? id;
  String? tenThietBiKyThuat;
  String? soHieu;
  String? imageUrl;

  Datum({
    this.id,
    this.tenThietBiKyThuat,
    this.soHieu,
    this.imageUrl,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tenThietBiKyThuat: json["tenThietBiKyThuat"],
        soHieu: json["soHieu"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tenThietBiKyThuat": tenThietBiKyThuat,
        "soHieu": soHieu,
        "imageUrl": imageUrl,
      };
}
