import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../login/screen_login.dart';
import '../../network/models/tiepnhanxesuachua_model.dart';

String? imageLink;

class ImageUploader {
  final Dio dio = Dio();

  BuildContext getCorrectContext(BuildContext? context) {
    if (context != null) {
      return context;
    } else {
      throw Exception("Context is null");
    }
  }

  Future<void> uploadImage(
      dynamic context, File imageFile, String uploadUrl) async {
    try {
      String fileName = imageFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        // lấy thông tin upload trên minio
        'upload': await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

      Response response = await dio.post(
        uploadUrl,
        data: formData,
      );
      imageLink = response.data["data"][0];
      // print('Response Status Code: ${response.statusCode}');
      // print('Response Body: ${response.data["data"][0]}');

      if (response.statusCode != 200 && response.statusCode != 201) {
        ScaffoldMessenger.of(getCorrectContext(context)).showSnackBar(SnackBar(
          content:
              Text('Upload failed with status code: ${response.statusCode}'),
          backgroundColor: Colors.red,
        ));
      } else {
        ScaffoldMessenger.of(getCorrectContext(context)).showSnackBar(
          const SnackBar(
            content: Text('Upload success'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (error) {
      throw Exception('Error uploading image: $error');
    }
  }
}

class TiepNhan extends StatefulWidget {
  const TiepNhan({super.key});

  @override
  State<TiepNhan> createState() => _TiepNhanState();
}

class _TiepNhanState extends State<TiepNhan> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kiemNhanSuaChua = TextEditingController();
  final TextEditingController _ttkt = TextEditingController();
  final TextEditingController _tenKhachHang = TextEditingController();
  final TextEditingController _nguoiDaiDien = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _khuVuc = TextEditingController();
  final TextEditingController _diaChi = TextEditingController();
  final TextEditingController _dienThoai = TextEditingController();
  final TextEditingController _tenTBKT = TextEditingController();
  final TextEditingController _soHieu = TextEditingController();
  final TextEditingController _soXX = TextEditingController();
  final TextEditingController _dangKy = TextEditingController();
  final TextEditingController _lenhSuaChua = TextEditingController();
  final TextEditingController _customerId = TextEditingController();

  File? _avatar;
  File? _image;
  final ImageUploader imageUploader = ImageUploader();

  Future<void> _pickImageAvatar(BuildContext context) async {
    final BuildContext context =
        this.context; // Access context using this.context!

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _avatar = File(pickedFile.path);
      });

      try {
        // ignore: use_build_context_synchronously
        await imageUploader.uploadImage(
          // ignore: use_build_context_synchronously
          context, // Pass context directly
          _avatar!,
          'http://36.50.63.16:3005/v1/minio/upload/customer/customer-avatar',
        );
      } catch (error) {
        // Show an error message to the user
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error uploading image: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _pickImageThietBi() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // ignore: use_build_context_synchronously
      await imageUploader.uploadImage(
        // ignore: use_build_context_synchronously
        context,
        _image!,
        'http://36.50.63.16:3005/v1/minio/upload/customer/customer-ho-so-anh-tiep-nhan',
      );
    }
  }

  @override
  void dispose() {
    _kiemNhanSuaChua.dispose();
    _ttkt.dispose();
    _tenKhachHang.dispose();
    _nguoiDaiDien.dispose();
    _email.dispose();
    _khuVuc.dispose();
    _diaChi.dispose();
    _dienThoai.dispose();
    _tenTBKT.dispose();
    _soHieu.dispose();
    _soXX.dispose();
    _customerId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tiếp nhận sữa chữa xe mới',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildThongTinKhachHang(),
              _buildThongTinThietBiKyThuat(),
              _buildHoSoXeVaoSuaChua(),
              _buildSaveInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSaveInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      child: TextButton(
        onPressed: _luuThongTin,
        child: const SizedBox(
          height: 30,
          width: 100,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                Text(
                  'Lưu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildHoSoXeVaoSuaChua() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            'Hồ sơ xe vào sửa chữa',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.left,
          ),
          _buildUploadRow(Icons.description_outlined, 'Lệnh sửa chữa'),
          _buildUploadRow(Icons.task_outlined, 'Đăng ký'),
          _buildUploadRow(Icons.document_scanner_outlined, 'Lý lịch TTKT'),
        ],
      ),
    );
  }

  Widget _buildUploadRow(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon),
        const Padding(padding: EdgeInsets.only(left: 5)),
        Text(label),
        TextButton(
          onPressed: () {},
          child: const Text('Tải lên'),
        ),
      ],
    );
  }

  Container _buildThongTinThietBiKyThuat() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            'Thông tin thiết bị kỹ thuật',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.left,
          ),
          _buildTextFormField(_tenTBKT, 'Tên TBKT', Icons.car_rental),
          _buildTextFormField(_soHieu, 'Số hiệu', Icons.pix_outlined),
          _buildTextFormField(_soXX, 'Số XX', Icons.dashboard_outlined),
          _buildTextFormField(_kiemNhanSuaChua,
              'Thông tin kiểm nhận vào sữa chữa', Icons.assignment_outlined),
          _buildTextFormField(_ttkt, 'Thông tin tình trạng kỹ thuật',
              Icons.verified_user_outlined),
          _getImageThietBi()
        ],
      ),
    );
  }

  SizedBox _getImageThietBi() {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          TextButton.icon(
            onPressed: () {
              _pickImageThietBi();
            },
            icon: const Icon(Icons.add_a_photo_outlined),
            label: const Text('Ảnh đại diện'),
          ),
          _image != null
              ? Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(_image!),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField(
      TextEditingController controller, String hintText, IconData prefixIcon) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Thông tin không được để trống';
      //   }
      //   return null;
      // },
    );
  }

  Container _buildThongTinKhachHang() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông tin khách hàng',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.left,
          ),
          _buildTextFormField(_tenKhachHang, 'Khách hàng',
              Icons.supervised_user_circle_outlined),
          _buildTextFormField(
              _nguoiDaiDien, 'Người đại diện', Icons.perm_identity_outlined),
          _buildTextFormField(_email, 'Email', Icons.email_outlined),
          _buildTextFormField(_diaChi, 'Địa chỉ', Icons.room_outlined),
          _buildTextFormField(
              _dienThoai, 'Điện thoại', Icons.phone_iphone_outlined),
          _buildTextFormField(_khuVuc, 'Khu vực', Icons.stars_outlined),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: () => _pickImageAvatar(context),
                  icon: const Icon(Icons.add_a_photo_outlined),
                  label: const Text('Ảnh đại diện'),
                ),
                _avatar != null
                    ? Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(_avatar!),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _luuThongTin() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        Dio dio = Dio();
        TiepNhanKhachHang tiepNhanKhachHang = TiepNhanKhachHang(
          customer: Customer(
            address: _diaChi.text,
            area: _khuVuc.text,
            avatar: imageLink,
            // response.data["data"][0],
            email: _email.text,
            name: _tenKhachHang.text,
            phone: _dienThoai.text,
            represent: _nguoiDaiDien.text,
          ),
          customerId: 1,
          hoSo: HoSo(
            dangKy: _dangKy.text,
            image: imageLink,
            lenhSuaChua: _lenhSuaChua.text,
            soHieu: _soHieu.text,
            soXuatXuong: _soXX.text,
            tenThietBiKyThuat: _tenTBKT.text,
            thongTinKiemNhanVaoSuaChua: _kiemNhanSuaChua.text,
            thongTinTinhTrangKyThuat: _ttkt.text,
          ),
        );

        // Convert the model instance to a JSON map
        Map<String, dynamic> requestData = tiepNhanKhachHang.toJson();

        Response response = await dio.post(
          'http://36.50.63.16:3005/v1/customer/tiep-nhan-sua-chua',
          data: requestData,
          options: Options(
            headers: {"authorization": "Bearer ${ScreenLoginState.token}"},
          ),
        );

        if (response.statusCode == 200) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Lưu thông tin thành công')),
          );

          // Clear text controllers after successful submission
          _kiemNhanSuaChua.clear();
          _ttkt.clear();
          _tenKhachHang.clear();
          _nguoiDaiDien.clear();
          _email.clear();
          _khuVuc.clear();
          _diaChi.clear();
          _dienThoai.clear();
          _tenTBKT.clear();
          _soHieu.clear();
          _soXX.clear();
        } else {
          String message =
              response.data != null && response.data['message'] != null
                  ? response.data['message']
                  : 'Lỗi không xác định';
          _showErrorDialog(message);
        }
      } on DioException catch (e) {
        String message = e.response != null
            ? 'Lỗi: ${e.response?.statusCode} - ${e.response?.data['message']}'
            : 'Lỗi kết nối';
        _showErrorDialog(message);
      } catch (error) {
        _showErrorDialog('Lỗi không xác định: ${error.toString()}');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Thông báo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
