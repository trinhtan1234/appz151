import 'package:flutter/material.dart';
import 'login/info_profile_user.dart';
import 'manhinh/kiemtra/kiemtrahuhong.dart';
import 'manhinh/noidung/noidunghuhong.dart';
import 'manhinh/thunghiem/thunghiemsanpham.dart';
import 'manhinh/tiepnhan/danhsachxe.dart';
import 'network/bloc/bloc.dart';
import 'network/models/info_user_model.dart';
import 'manhinh/congviec/congviecsuachua.dart';
import 'manhinh/tiendo/quatrinhsuachua.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> texts = [
    'Danh sách xe sửa chữa',
    'Kiểm tra hư hỏng',
    'Nội dung hư hỏng',
    'Công việc sửa chữa',
    'Thử nghiệm sản phẩm',
    'Tiến độ sửa chữa',
  ];
  List<IconData> icons = [
    Icons.assignment_outlined,
    Icons.build_outlined,
    Icons.done_all_outlined,
    Icons.insights_outlined,
    Icons.abc,
    Icons.ac_unit_rounded,
  ];
  final UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    _userBloc.getUserProfile();
    super.initState();
  }

  @override
  void dispose() {
    _userBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InfoUserProfile(),
                ),
              );
            },
            child: Row(
              children: [
                StreamBuilder<UserProfile?>(
                  stream: _userBloc.userStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final user = snapshot.data;
                      return Text(
                        user?.data?.familyName ?? '',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error loading user profile: ${snapshot.error}');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                const Padding(padding: EdgeInsets.only(left: 5)),
                ClipOval(
                  child: Image.asset(
                    'assets/imageshome/1.jpg',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Padding(padding: EdgeInsets.only(top: 10)),
          const Text('Quản lý quy trình sữa chữa Z151',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontSize: 20),
              textAlign: TextAlign.center),
          // const Padding(padding: EdgeInsets.only(top: 50)),
          Expanded(
            child: GridView.builder(
              itemCount: texts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DanhSachXeTiepNhan(),
                          ),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KiemTraHuHong(),
                          ),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NoiDungHuHong(),
                          ),
                        );
                        break;
                      case 3:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuanLyCongViec(),
                          ),
                        );
                        break;
                      case 4:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThuNghiemSanPham(),
                          ),
                        );
                        break;
                      case 5:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuaTrinhSuaChua(),
                          ),
                        );
                        break;
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.deepPurple,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    icons[index],
                                    size: 50,
                                    color: Colors.deepPurple,
                                  ),
                                  Text(
                                    texts[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Xem tài liệu hướng dẫn'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Hotline: 0974322222'),
          ),
        ],
      ),
    );
  }
}
