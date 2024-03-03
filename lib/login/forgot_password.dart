import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKeyForgotPassword = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Form(
              key: _formKeyForgotPassword,
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
        _ForgotPassword(),
        const Padding(padding: EdgeInsets.only(top: 140)),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  ElevatedButton _ForgotPassword() {
    return ElevatedButton(
      onPressed: () {},
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
          child: Row(
            children: [
              Icon(
                Icons.key_outlined,
                color: Colors.white,
              ),
              Padding(padding: EdgeInsets.only(right: 10)),
              Text(
                'Lấy lại mật khẩu mặc định',
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
          'QUÊN MẬT KHẨU',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
