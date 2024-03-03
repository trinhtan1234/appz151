import 'dart:convert';


TiepNhanKhachHang tiepNhanKhachHangFromJson(String str) =>
    TiepNhanKhachHang.fromJson(json.decode(str));

String tiepNhanKhachHangToJson(TiepNhanKhachHang data) =>
    json.encode(data.toJson());

class TiepNhanKhachHang {
  Customer? customer;
  int? customerId;
  HoSo? hoSo;

  TiepNhanKhachHang({
    this.customer,
    this.customerId,
    this.hoSo,
  });

  factory TiepNhanKhachHang.fromJson(Map<String, dynamic> json) =>
      TiepNhanKhachHang(
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        customerId: json["customerId"],
        hoSo: json["hoSo"] == null ? null : HoSo.fromJson(json["hoSo"]),
      );

  Map<String, dynamic> toJson() => {
        "customer": customer?.toJson(),
        "customerId": customerId,
        "hoSo": hoSo?.toJson(),
      };
}

class Customer {
  String? address;
  String? area;
  String? avatar;
  String? email;
  String? name;
  String? phone;
  String? represent;

  Customer({
    this.address,
    this.area,
    this.avatar,
    this.email,
    this.name,
    this.phone,
    this.represent,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        address: json["address"],
        area: json["area"],
        avatar: json["avatar"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        represent: json["represent"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "area": area,
        "avatar": avatar,
        "email": email,
        "name": name,
        "phone": phone,
        "represent": represent,
      };
}

class HoSo {
  String? dangKy;
  String? image;
  String? lenhSuaChua;
  String? lyLichBienBanSuaChua;
  String? soHieu;
  String? soXuatXuong;
  String? tenThietBiKyThuat;
  String? thongTinKiemNhanVaoSuaChua;
  String? thongTinTinhTrangKyThuat;

  HoSo({
    this.dangKy,
    this.image,
    this.lenhSuaChua,
    this.lyLichBienBanSuaChua,
    this.soHieu,
    this.soXuatXuong,
    this.tenThietBiKyThuat,
    this.thongTinKiemNhanVaoSuaChua,
    this.thongTinTinhTrangKyThuat,
  });

  factory HoSo.fromJson(Map<String, dynamic> json) => HoSo(
        dangKy: json["dangKy"],
        image: json["image"],
        lenhSuaChua: json["lenhSuaChua"],
        lyLichBienBanSuaChua: json["lyLichBienBanSuaChua"],
        soHieu: json["soHieu"],
        soXuatXuong: json["soXuatXuong"],
        tenThietBiKyThuat: json["tenThietBiKyThuat"],
        thongTinKiemNhanVaoSuaChua: json["thongTinKiemNhanVaoSuaChua"],
        thongTinTinhTrangKyThuat: json["thongTinTinhTrangKyThuat"],
      );

  Map<String, dynamic> toJson() => {
        "dangKy": dangKy,
        "image": image,
        "lenhSuaChua": lenhSuaChua,
        "lyLichBienBanSuaChua": lyLichBienBanSuaChua,
        "soHieu": soHieu,
        "soXuatXuong": soXuatXuong,
        "tenThietBiKyThuat": tenThietBiKyThuat,
        "thongTinKiemNhanVaoSuaChua": thongTinKiemNhanVaoSuaChua,
        "thongTinTinhTrangKyThuat": thongTinTinhTrangKyThuat,
      };
}
