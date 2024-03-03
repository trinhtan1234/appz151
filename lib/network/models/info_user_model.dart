import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  Data? data;
  dynamic errors;
  bool? success;

  UserProfile({
    this.data,
    this.errors,
    this.success,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
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
  String? createdBy;
  String? updatedBy;
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? userName;
  String? phone;
  dynamic familyName;
  bool? isBanned;
  Department? role;
  Department? department;
  List<dynamic>? permission;

  Data({
    this.createdBy,
    this.updatedBy,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userName,
    this.phone,
    this.familyName,
    this.isBanned,
    this.role,
    this.department,
    this.permission,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        id: json["ID"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null
            ? null
            : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        userName: json["userName"],
        phone: json["phone"],
        familyName: json["familyName"],
        isBanned: json["isBanned"],
        role: json["role"] == null ? null : Department.fromJson(json["role"]),
        department: json["department"] == null
            ? null
            : Department.fromJson(json["department"]),
        permission: json["permission"] == null
            ? []
            : List<dynamic>.from(json["permission"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "userName": userName,
        "phone": phone,
        "familyName": familyName,
        "isBanned": isBanned,
        "role": role?.toJson(),
        "department": department?.toJson(),
        "permission": permission == null
            ? []
            : List<dynamic>.from(permission!.map((x) => x)),
      };
}

class Department {
  String? createdBy;
  String? updatedBy;
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? name;
  String? code;
  bool? status;
  String? note;
  int? parentId;
  dynamic children;

  Department({
    this.createdBy,
    this.updatedBy,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
    this.code,
    this.status,
    this.note,
    this.parentId,
    this.children,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        id: json["ID"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null
            ? null
            : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        name: json["name"],
        code: json["code"],
        status: json["status"],
        note: json["note"],
        parentId: json["parentId"],
        children: json["children"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "name": name,
        "code": code,
        "status": status,
        "note": note,
        "parentId": parentId,
        "children": children,
      };
}
