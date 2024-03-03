import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import 'forgot_password.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => ScreenLoginState();
}

class ScreenLoginState extends State<ScreenLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordHidden = true;

  static String token = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: _formLogin(),
            ),
          ),
        ),
      ),
    );
  }

  Column _formLogin() {
    return Column(
      children: [
        const Divider(),
        const Padding(padding: EdgeInsets.only(top: 130)),
        _tenDangNhap(),
        const Padding(padding: EdgeInsets.only(top: 10)),
        _matKhau(),
        const Padding(padding: EdgeInsets.only(top: 40)),
        _loginButton(),
        _quenMatKhau(),
        const Padding(padding: EdgeInsets.only(top: 130)),
        const Text(
          'Nếu bạn chưa có tài khoản vui lòng liên hệ quản trị viên của nhà máy!',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  TextButton _quenMatKhau() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const ForgotPassword(),
          ),
        );
      },
      child: Center(
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'Quên mật khẩu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _loginButton() {
    return ElevatedButton(
      onPressed: () {
        performLogin();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const SizedBox(
        height: 50,
        width: 300,
        child: Center(
          child: Text(
            'Đăng nhập',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _matKhau() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _isPasswordHidden,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mật khẩu không được để trống';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: 'Mật khẩu',
        prefixIcon: const Icon(Icons.password),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordHidden = !_isPasswordHidden;
            });
          },
          icon: Icon(
            _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }

  SizedBox _tenDangNhap() {
    return SizedBox(
      child: TextFormField(
        controller: _userNameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Tên đăng nhập không được để trống';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: 'Tên đăng nhập',
          prefixIcon: const Icon(Icons.person),
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: const Center(
        child: Text(
          'ĐĂNG NHẬP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }

  void performLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        Dio dio = Dio();
        Response response = await dio.post(
          'http://36.50.63.16:3005/v1/login',
          data: {
            'userName': _userNameController.text,
            'password': _passwordController.text,
          },
        );

        if (response.statusCode == 200) {
          token = response.data["data"]["token"];
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        } else {
          // Handle specific non-200 status codes for more informative messages
          if (response.statusCode == 401) {
            _showErrorDialog('Tên đăng nhập hoặc mật khẩu không đúng');
          } else {
            _showErrorDialog('Lỗi đăng nhập: ${response.statusCode}');
          }
        }
        // ignore: deprecated_member_use
      } on DioError catch (e) {
        // Handle DioException, providing more specific error messages
        if (e.response != null) {
          _showErrorDialog(
              'Tên đăng nhập và mật khẩu không đúng: ${e.response?.statusCode}');
          // ignore: deprecated_member_use
        } else if (e.type == DioErrorType.connectionTimeout) {
          _showErrorDialog('Lỗi kết nối máy chủ');
          // ignore: deprecated_member_use
        } else {
          _showErrorDialog('Lỗi không xác định: ${e.message}');
        }
      } catch (error) {
        _showErrorDialog('Lỗi đăng nhập: chưa xác định');
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
