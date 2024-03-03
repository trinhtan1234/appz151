import 'package:flutter/material.dart';

import 'login/chang_pasword.dart';
import 'login/info_profile_user.dart';
import 'login/screen_login.dart';
import 'manhinh/tiepnhan/tiepnhan.dart';
import 'manhinh/tonghop/tonghopsuachua.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const ScreenLogin(),
      routes: {
        '/login': (context) => const ScreenLogin(),
        '/changepassword': (context) => const ChangPassword(),
        '/infor_user': (context) => const InfoUserProfile(),
        '/tiennhap': (context) => const TiepNhan(),

        '/tonghop': (context) => const TongHop(),
      },
    );
  }
}
