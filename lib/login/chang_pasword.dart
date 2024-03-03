import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import 'screen_login.dart';

class ChangPassword extends StatefulWidget {
  const ChangPassword({super.key});

  @override
  State<ChangPassword> createState() => _ChangPasswordState();
}

class _ChangPasswordState extends State<ChangPassword> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _passwordOldController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmpasswordController;

  @override
  void initState() {
    _passwordOldController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmpasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordOldController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin tài khoản'),
        actions: [
          IconButton(
            onPressed: _logOut,
            icon: const Row(
              children: [
                Text(
                  'Đăng xuất',
                  style: TextStyle(color: Colors.red),
                ),
                Padding(padding: EdgeInsets.only(right: 5)),
                Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              controller: _passwordOldController,
              decoration: const InputDecoration(labelText: 'Mật khẩu cũ'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập mật khẩu cũ';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Mật khẩu Mới'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập mật khẩu cũ';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _confirmpasswordController,
              decoration: const InputDecoration(labelText: 'Xác nhận mật khẩu'),
              validator: (value) {
                if (value != _passwordController.text || value!.isEmpty) {
                  return 'Mật khẩu xác nhận không khớp';
                }
                return null;
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
              onPressed: performLogin,
              child: const Text('Đổi mật khẩu'),
            ),
          ],
        ),
      ),
    );
  }

  void performLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        Dio dio = Dio();
        Response response = await dio.put(
            'http://36.50.63.16:3005/v1/user/change-password',
            data: {
              'oldpassword': _passwordOldController.text,
              'password': _passwordController.text,
            },
            options: Options(headers: {
              "authorization": "Bearer ${ScreenLoginState.token}"
            }));
        if (response.statusCode == 200) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } else {
          _showErrorDialog('Lỗi đăng nhập');
        }
        // ignore: deprecated_member_use
      } on DioError catch (e) {
        // Handle DioException
        if (e.response != null) {
          // The server returned an error response
          _showErrorDialog('Lỗi đăng nhập: ${e.response?.statusCode}');
        } else {
          // Dio error without a response
          _showErrorDialog('Lỗi đăng nhập: ${e.message}');
        }
      } catch (error) {
        // Handle other types of errors
        _showErrorDialog('Lỗi đăng nhập');
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

  void _logOut() {
    ScreenLoginState.token = "";
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ScreenLogin()),
    );
  }
}
