import 'dart:convert';

TaiKhoan taiKhoanFromJson(String str) => TaiKhoan.fromJson(json.decode(str));

String taiKhoanToJson(TaiKhoan data) => json.encode(data.toJson());

class TaiKhoan {
  int? departmentId;
  String? familyName;
  String? passWord;
  List<int>? permissions;
  String? phone;
  int? roleId;
  String? userName;

  TaiKhoan({
    this.departmentId,
    this.familyName,
    this.passWord,
    this.permissions,
    this.phone,
    this.roleId,
    this.userName,
  });

  factory TaiKhoan.fromJson(Map<String, dynamic> json) => TaiKhoan(
        departmentId: json["departmentID"],
        familyName: json["familyName"],
        passWord: json["passWord"],
        permissions: json["permissions"] == null
            ? []
            : List<int>.from(json["permissions"]!.map((x) => x)),
        phone: json["phone"],
        roleId: json["roleID"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "departmentID": departmentId,
        "familyName": familyName,
        "passWord": passWord,
        "permissions": permissions == null
            ? []
            : List<dynamic>.from(permissions!.map((x) => x)),
        "phone": phone,
        "roleID": roleId,
        "userName": userName,
      };
}
